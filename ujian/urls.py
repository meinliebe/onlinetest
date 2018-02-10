from django.conf.urls import url
from ujian import views

urlpatterns = [
	url(r'^$', views.login, name='login'),
	url(r'^dashboard/$', views.dashboard_peserta, name='dashboard_peserta'),
	# url(r'^confirm/$', views.konfirmasi, name='konfirmasi'),
	url(r'^mulai/$', views.mulai_ujian, name='mulai_ujian'),
	url(r'^selesai/$', views.selesai_ujian, name='selesai_ujian'),
	url(r'^logout/$', views.logout, name='logout'),

	# url(r'^crud_strategi/(?P<task>\w{0,10})/$', views.crud_strategi, name='crud_strategi'),
]