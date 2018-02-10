"""testkom_project URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf.urls import include, url

from ujian import views as ujian_views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('cbt/', include('ujian.urls')),
    path('administrator/', include('soal.urls')),
    url(r'^$', ujian_views.login, name='login'), # login user

]

admin.site.site_header = 'TEST KOMPETENSI UMS'
