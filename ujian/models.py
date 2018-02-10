from django.db import models
from django.contrib.auth.models import User
from soal.models import Jawaban, Mata_kuliah
from datetime import timedelta
import datetime

# Create your models here.
class Periode(models.Model):
	# TODO: Define fields here
	kode = models.CharField(max_length=10)
	nama = models.CharField(max_length=255)
	tgl_mulai = models.DateField()
	tgl_selesai = models.DateField()
	pic = models.CharField(max_length=100)
	catatan = models.TextField(blank=True, null=True)

	class Meta:
		verbose_name = "Periode Test"
		verbose_name_plural = "Periode Test"

	def __str__(self):
		return self.nama

class Peserta(models.Model):
	# TODO: Define fields here
	nim	= models.CharField(max_length=20)
	nama = models.CharField(max_length=255)
	uniid = models.ForeignKey(User, on_delete=models.CASCADE) #ketika development memakai User Django
	program_studi = models.CharField(max_length=255)
	mata_kuliah = models.ForeignKey(Mata_kuliah, on_delete=models.CASCADE)
	class Meta:
		verbose_name = "Peserta Test"
		verbose_name_plural = "Peserta Test"

	def __str__(self):
		return self.nama

class Data_test(models.Model):
	# TODO: Define fields here
	periode = models.ForeignKey(Periode, on_delete=models.CASCADE)
	peserta = models.ForeignKey(Peserta, on_delete=models.CASCADE)	
	mata_kuliah = models.ForeignKey(Mata_kuliah, on_delete=models.CASCADE)	
	jawaban = models.ForeignKey(Jawaban, on_delete=models.CASCADE, default=None)
	waktu = models.DateTimeField(auto_now_add=True)  # menyimpan waktu test

	class Meta:
		verbose_name = "Data Hasil Test"
		verbose_name_plural = "Data Hasil Test"

	def __str__(self):
		return self.nama

class Status_peserta(models.Model):
	# TODO: Define fields here
	nim = models.CharField(max_length=255)
	peserta = models.ForeignKey(Peserta, on_delete=models.CASCADE)
	mata_kuliah = models.ForeignKey(Mata_kuliah, on_delete=models.CASCADE)
	status = models.BooleanField(default=True) #true = Siap test False = Selesai test
	nilai = models.IntegerField(blank=True, null=True)
	mulai = models.DateTimeField(blank=True, null=True)
	selesai = models.DateTimeField(blank=True, null=True)

	class Meta:
		verbose_name = "Status Peserta"
		verbose_name_plural = "Status Peserta"

	@property
	def stat(self):
		if self.status == True and self.mulai == None:
			sts = 'Belum Ujian'
		elif self.status == True and self.mulai != None:
			sts = 'Sedang Ujian'
		else:
			sts = 'Selesai Ujian'
		return sts

	def difft(self):
		if self.mulai:
			now = datetime.datetime.now()
			mulai = self.mulai + timedelta(hours = 1)
			timediff = mulai.replace(tzinfo=None) - now			
			return timediff.total_seconds()

	def __str__(self):
		# return '%s:Peserta-%s : %s' % (self.peserta.nama, self.status)
		return self.nim

	