from django import forms
from django.forms import ModelForm, CharField
from crispy_forms.layout import Layout, Div, Submit, HTML, Button, Row, Field
from crispy_forms.helper import FormHelper
from crispy_forms.bootstrap import (PrependedText, PrependedAppendedText, FormActions, StrictButton)

from soal.models import Mata_kuliah, Kategori_soal, Soal_grup, Soal, Jawaban
from ujian.models import Peserta
from ckeditor_uploader.widgets import CKEditorUploadingWidget
from ckeditor.widgets import CKEditorWidget

class SoalForm(forms.ModelForm):
	class Meta:
		model = Soal
		fields = ('kategori_soal', 'sifat_soal', 'tipe_soal', 'grup', 'text_soal')
		widgets = {
			'text_soal': CharField(widget=CKEditorUploadingWidget())
		}
	helper = FormHelper()
	helper.form_method = 'POST'	
	helper.form_class = 'form-horizontal'
	helper.label_class = 'col-sm-2'
	helper.field_class = 'col-sm-5'
	helper.layout = Layout(
		Field('kategori_soal'),
		Field('sifat_soal'),
		Field('tipe_soal'),
		Field('grup'),
		# Field('text_soal', css_class = 'text-soal'),
		FormActions(StrictButton('Simpan', name="simpan", type="submit", css_class="btn btn-success"))
	)

class JawabanForm(forms.ModelForm):
	class Meta:
		model = Jawaban
		fields = ('text_jawaban','gambar','jawaban_benar')
	
	
class UploadPesertaForm(forms.Form):
	mata_kuliah = forms.ModelChoiceField(queryset = Mata_kuliah.objects.all())
	file_csv = forms.FileField()

	helper = FormHelper()
	helper.form_method = 'POST'
	helper.form_class = 'form-horizontal'
	helper.label_class = 'col-sm-2'
	helper.field_class = 'col-sm-5'
	helper.layout = Layout(
		Field('mata_kuliah', 'file_csv'),
		FormActions(StrictButton('Upload', name="simpan", type="submit", css_class="btn btn-success btn-sm"))		
	)	

class KategoriSoalForm(forms.ModelForm):
	class Meta:
		model = Kategori_soal
		fields = ('kategori','mata_kuliah')
	helper = FormHelper()
	helper.form_method = 'POST'
	helper.form_class = 'form-horizontal'
	helper.label_class = 'col-sm-3'
	helper.field_class = 'col-sm-8'
	helper.layout = Layout(
		Field('mata_kuliah', 'kategori'),
		FormActions(StrictButton('Simpan', name="simpan", type="submit", css_class="btn btn-success btn-sm"))		
	)	
	
class PesertaForm(forms.ModelForm):
    class Meta:
        model = Peserta
        fields = ('nim', 'nama', 'program_studi', 'mata_kuliah')

    