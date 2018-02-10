from django.contrib import admin
from .models import Soal, Soal_grup, Jawaban, Kategori_soal, Mata_kuliah
from django.forms.models import BaseInlineFormSet
#from nested_inlines.admin import NestedTabularInline, NestedModelAdmin, NestedStackedInline

# Register your models here.
class JawabanFormSet(BaseInlineFormSet):
    def __init__(self, *args, **kwargs):
        kwargs['initial'] = [
            {'text_jawaban': 'A'}, {'text_jawaban': 'B'}, {'text_jawaban': 'C'}, {'text_jawaban': 'D'}
        ]
        super(JawabanFormSet, self).__init__(*args, **kwargs)

class InlineJawaban(admin.TabularInline):
    model = Jawaban
    extra = 1
    #formset = JawabanFormSet

class SoalAdmin(admin.ModelAdmin):
    #fields = ('Mata_kuliah','text_soal','grup')
    inlines = [InlineJawaban,]
    list_display = ('id','kategori_soal', 'grup', 'text_soal', 'check_jawaban')
    list_filter = ('kategori_soal', 'sifat_soal', 'tipe_soal')
    search_fields = ('text_soal','id')

admin.site.register(Soal,SoalAdmin)
admin.site.register(Soal_grup)
admin.site.register(Mata_kuliah)
admin.site.register(Kategori_soal)
