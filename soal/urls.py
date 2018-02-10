from django.conf.urls import url
from soal import views

urlpatterns = [

	url(r'^dashboard/$', views.dashboard_admin, name='dashboard_admin'),	
	
	url(r'^soal/$', views.list_soal, name='list_soal'),	
	url(r'^soal/view/(?P<id_soal>\w{0,10})/$', views.view_soal, name='view_soal'),	
	url(r'^soal/ubah/(?P<id_soal>\w{0,10})/$', views.ubah_soal, name='ubah_soal'),	
	url(r'^soal/hapus/$', views.hapus_soal, name='hapus_soal'),	
	url(r'^soal/tambah/$', views.tambah_soal, name='tambah_soal'),	

	url(r'^soal/kategori/$', views.tambah_kategori_soal, name='tambah_kategori_soal'),	
	url(r'^soal/kategori/ubah/(?P<id_kategori>\w{0,10})/$', views.ubah_kategori_soal, name='ubah_kategori_soal'),	
	url(r'^soal/kategori/hapus/$', views.hapus_kategori_soal, name='hapus_kategori_soal'),	

	url(r'^peserta/$', views.peserta_ujian, name='peserta_ujian'),	
	url(r'^peserta/upload$', views.upload_peserta, name='upload_peserta'),	
	url(r'^peserta/hapus$', views.hapus_peserta, name='hapus_peserta'),	
	url(r'^peserta/ubah/(?P<id_peserta>\w{0,10})/$', views.ubah_peserta, name='ubah_peserta'),	

	# url(r'^crud_strategi/(?P<task>\w{0,10})/$', views.crud_strategi, name='crud_strategi'),
]