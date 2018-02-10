from django.shortcuts import render, redirect, render_to_response, get_object_or_404
from django.contrib.auth.models import User
from django.core.exceptions import ObjectDoesNotExist, EmptyResultSet
from django.contrib.auth import authenticate, logout as django_logout, login as auth_login
from django.http import HttpResponseRedirect, HttpResponse, JsonResponse
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_protect
from django.conf import settings
from django.db import transaction, DatabaseError, Error, IntegrityError
from django.db.models import Count
from ujian.models import Peserta, Status_peserta, Data_test, Periode, Mata_kuliah
from soal.models import Soal, Kategori_soal, Jawaban
from soal import views as s_views
import datetime, random

# Create your views here.
def login(request):
	data = {}
	data['app_title'] = 'CBT | Login User'	
	data['is_login'] = True
	if request.user.is_authenticated:
		if request.user.is_staff:
			return redirect(s_views.dashboard_admin)
		else:
			return redirect(dashboard_peserta)
	if request.POST:
		if request.POST.get('username') and request.POST.get('password'):
			user = authenticate(username=request.POST.get('username'), password=request.POST.get('password'))
			if user is not None:
				if user.is_active:
					# if user.is_staff:										
					auth_login(request, user)
					request.session['user_id'] = user.id
					request.session['username'] = user.username
					if request.user.is_staff:
						return redirect(s_views.dashboard_admin)
					else:
						return redirect(dashboard_peserta)
					# else:
					# 	messages.add_message(request, messages.WARNING, 'Maaf, anda bukan staff')
				else:
					messages.add_message(request, messages.WARNING, 'User belum aktif, silakan hubungi Administrator')
			else:
				messages.add_message(request, messages.ERROR, 'Username atau password salah')
		else:
				messages.add_message(request, messages.INFO, 'Username atau password tidak boleh kosong')			
	return render(request, 'login.html', data)

def logout(request):
	django_logout(request)
	return HttpResponseRedirect('/')

@csrf_protect
@login_required(login_url = settings.LOGIN_URL)
def dashboard_peserta(request):
	data = m_k_dict = {}
	mata_kuliah = []
	data['app_title'] = 'Dashboard Peserta'
	logged_id = request.user.id	
	logged_nim = request.user.username

	#cek apakah mahasiswa masih ada test yang masih berlangsung
	try:
		active_test_obj = Status_peserta.objects.get(status = 1, nim = logged_nim)
		return redirect('mulai_ujian')
	except ObjectDoesNotExist:
		try:					
			peserta_obj = Peserta.objects.filter(uniid = logged_id).values('nama','nim','program_studi').annotate(t_uniid = Count('nim'))
			mata_kuliah_obj = Peserta.objects.filter(uniid = logged_id).values('mata_kuliah','mata_kuliah__mata_kuliah', 'id')
			for m_k in mata_kuliah_obj:
				try:
					status_peserta = Status_peserta.objects.get(peserta = m_k['id'])
					s_p = status_peserta.status
				except ObjectDoesNotExist:
					s_p = True
				m_k_dict = {'mata_kuliah': m_k['mata_kuliah'], 'nama_mata_kuliah': m_k['mata_kuliah__mata_kuliah'], 'status_test': s_p}
				mata_kuliah.append(m_k_dict)
			data['matkul'] = mata_kuliah
		except ObjectDoesNotExist:
			data['matkul'] = 0		
		data['peserta'] = peserta_obj

	if request.user.is_staff:
		data['is_staff'] = True
	else:
		data['is_staff'] = False

	return render(request, 'ujian/dashboard_peserta.html', data)
			
@csrf_protect
@transaction.atomic
@login_required(login_url = settings.LOGIN_URL)
def mulai_ujian(request):	
	data = {}
	status_obj = status = ''
	soal_list = []
	data['is_konfirmasi'] = True	
	mata_kuliah = request.POST.get('mata_kuliah')
	logged_id = request.user.id
	logged_nim = request.user.username
	
	try:
		active_test_obj = Status_peserta.objects.get(status = True, nim = logged_nim)
		peserta_obj = Peserta.objects.get(mata_kuliah = active_test_obj.mata_kuliah, nim = logged_nim, id = active_test_obj.peserta.id)
	except ObjectDoesNotExist:
		peserta_obj = Peserta.objects.get(uniid = logged_id, mata_kuliah = mata_kuliah)		

	#cari di status peserta yang sedang ujian (status = True)
	sts_obj = Status_peserta.objects.filter(nim = peserta_obj.nim, status = True, selesai__isnull = True).count()
	if sts_obj > 0:
		status_obj = Status_peserta.objects.get(nim = peserta_obj.nim, status = True)
	else:
		#cek sudah selesai test apa belum
		ujian_obj = Status_peserta.objects.filter(status = False, nilai__isnull = False, selesai__isnull = False, mata_kuliah = mata_kuliah, peserta = peserta_obj)
		if ujian_obj:
			data['peserta'] = peserta_obj
			data['nilai'] = ujian_obj
			data['more_space'] = False			
			return render(request, 'ujian/selesai_ujian.html', data)
		else:
			Status_peserta.objects.create(peserta = peserta_obj, nim = peserta_obj.nim, mata_kuliah = peserta_obj.mata_kuliah, mulai = datetime.datetime.now())
			status_obj = Status_peserta.objects.get(nim = peserta_obj.nim, status = True)
		
	waktu = status_obj.difft

	soal_obj = Soal.objects.filter(kategori_soal__mata_kuliah = peserta_obj.mata_kuliah)
	data['peserta'] = peserta_obj	
	data['waktu'] = waktu
	data['soal'] = soal_obj
	data['mata_kuliah'] = peserta_obj.mata_kuliah
	data['app_title'] = 'CBT | Ujian '+str(peserta_obj.mata_kuliah)
	return render(request, 'ujian/mulai_ujian.html', data)			


@csrf_protect
@transaction.atomic
@login_required(login_url = settings.LOGIN_URL)
def selesai_ujian(request):
	data = {}
	data['app_title'] = 'CBT | SELESAI UJIAN'
	data['more_space'] = True
	success = True
	already_test = True
	logged_id = request.user.id
	logged_nim = request.user.username

	p = Periode.objects.latest('id')
	matkul = request.POST.get('mata_kuliah')
	mata_kuliah = Mata_kuliah.objects.get(id = matkul)
	try:
		peserta_obj = Peserta.objects.get(uniid = logged_id, mata_kuliah = matkul)		
	except ObjectDoesNotExist:
		return redirect('dashboard_peserta')

	for key, value in request.POST.items():
		if key not in ['csrfmiddlewaretoken','mata_kuliah']:
			j = Jawaban.objects.get(id=value)
			try:
				with transaction.atomic():
					Data_test.objects.update_or_create(jawaban=j, defaults = {'periode': p, 'peserta': peserta_obj, 'mata_kuliah': mata_kuliah})
			except DatabaseError:
				success = False

	try:
		with transaction.atomic():					
			jwb = Data_test.objects.filter(periode = p, peserta = peserta_obj, mata_kuliah = matkul)
			benar = jwb.filter(jawaban__jawaban_benar = True).count()

			status_obj = Status_peserta.objects.filter(peserta = peserta_obj.id, selesai = None, mata_kuliah = mata_kuliah).update(status = False, selesai = datetime.datetime.now(), nilai = benar)
			
			data['peserta']	= peserta_obj
			nilai = Status_peserta.objects.filter(peserta = peserta_obj.id, selesai__isnull = False, mata_kuliah = mata_kuliah).values('nilai','mulai','selesai')

			data['peserta']	= peserta_obj
			data['nilai'] = nilai
	except DatabaseError:
		success = False

	if not success:
		data['pesan'] = 'Terjadi kesalahan, silakan hubungi Administrator IT'

	return render(request, 'ujian/selesai_ujian.html', data)

