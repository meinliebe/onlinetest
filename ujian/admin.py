from django.contrib import admin
from .models import Peserta, Periode, Status_peserta
# Register your models here.

class PesertaAdmin(admin.ModelAdmin):
	'''
		Admin View for Peserta
	'''
	list_display = ('nim','nama','program_studi','uniid','mata_kuliah',)
	list_filter = ('program_studi',)
	search_fields = ('nama','program_studi',)

admin.site.register(Peserta, PesertaAdmin)


class Status_pesertaAdmin(admin.ModelAdmin):
    '''
        Admin View for Status_peserta
    '''
    list_display = ('peserta','nim','mulai','selesai','nilai','mata_kuliah','status',)
    list_filter = ('status',)
    search_fields = ('peserta','nim',)

admin.site.register(Status_peserta, Status_pesertaAdmin)

admin.site.register(Periode)
