from django.db import models
from ckeditor.fields import RichTextField
# Create your models here.

def content_file_name(instance, filename):
	ext = filename.split('.')[-1]
	filename = "%s.%s" % (uuid.uuid4(), ext)
	return '/'.join(['audio', instance.user.username, filename])

TIPE_SOAL = (
	(1, 'Pilihan A, B, C, D'),
	(2, 'Pilihan 1, 2, 3 dan 4'),
	(3, 'Sebab Akibat'),
	(4, 'Pilihan A, B, C, D Tidak Acak'), #Posisi ABCD tetap, tidak di acak
)

SIFAT_SOAL = (
	(1, 'Mudah'),
	(2, 'Sedang'),
	(3, 'Sulit'),
	(4, 'Sulit Sekali'),
)

class Mata_kuliah(models.Model):
	# TODO: Define fields here
	kode = models.CharField(max_length=10) #kode Mata Kuliah
	mata_kuliah = models.CharField(max_length=255)
	class Meta:
		verbose_name = "Mata Kuliah"
		verbose_name_plural = "Mata Kuliah"

	def __str__(self):
		return self.mata_kuliah

class Kategori_soal(models.Model):
	# TODO: Define fields here
	mata_kuliah = models.ForeignKey(Mata_kuliah, on_delete=models.CASCADE)
	kategori = models.CharField(max_length=255)
	class Meta:
		verbose_name = "Kategori Soal"
		verbose_name_plural = "Kategori Soal"

	def __str__(self):
		return self.kategori

class Soal_grup(models.Model):
	# TODO: Define fields here
	nama = models.CharField(max_length=255)
	text_petunjuk = models.CharField(max_length=255)
	text_soal_grup = models.CharField(max_length=255)
	gambar = models.ImageField(blank=True)
	suara = models.FileField(blank=True)

	class Meta:
		verbose_name = "Grup Soal"
		verbose_name_plural = "Grup Soal"

	def __str__(self):
		return self.nama

class Penginput_soal(models.Model):
	uniid = models.CharField(max_length=255)
	class Meta:
		verbose_name = "Penginput Soal"
		verbose_name_plural = "Penginput Soal"

	def __str__(self):
		return self.uniid
		
class Soal(models.Model):
	# TODO: Define fields here
	kategori_soal = models.ForeignKey(Kategori_soal, on_delete=models.CASCADE)
	sifat_soal = models.SmallIntegerField(choices=SIFAT_SOAL, default=1)
	tipe_soal = models.SmallIntegerField(choices=TIPE_SOAL, default=1)
	text_bantuan = models.CharField(max_length=255, blank=True)
	text_soal = RichTextField(blank=True)
	is_soal_autoescape = models.BooleanField(default=False)
	is_jawaban_autoescape = models.BooleanField(default=False)
	gambar = models.ImageField(blank=True)
	suara = models.FileField(upload_to=content_file_name, blank=True)
	grup = models.ForeignKey(Soal_grup, on_delete=models.CASCADE, null=True, blank=True)
	user_insert = models.CharField(max_length=255, blank=True, null=True)
	insert_date = models.DateTimeField(auto_now_add=True)
	user_update = models.CharField(max_length=255, blank=True, null=True)
	last_update = models.DateTimeField(auto_now=True)
	
	def __str__(self):
		if self.text_soal == '':
			teks = ''
		else:
			teks = self.text_soal.split()[0]
		return '%s-[%s]' % (self.kategori_soal, teks + ' ...')

	def check_jawaban(self):
		return Jawaban.objects.filter(soal__id = self.id, jawaban_benar=True).count() == 1

	# def check_mata_kuliah(self):		
	# 	return self.kategori_soal.mata_kuliah

	# check_mata_kuliah.boolean = True
	check_jawaban.boolean = True
	check_jawaban.short_description = 'Check Status Jawaban'		

	class Meta:
		verbose_name = "Soal"
		verbose_name_plural = "Input Soal"

class Jawaban(models.Model):
	# TODO: Define fields here
	soal = models.ForeignKey(Soal, on_delete=models.CASCADE)
	text_jawaban = models.CharField(max_length=255, blank=True)
	gambar = models.ImageField(blank=True)
	jawaban_benar = models.BooleanField(default=False)
	user_insert = models.CharField(max_length=255, blank=True, null=True)
	insert_date = models.DateTimeField(auto_now_add=True)
	user_update = models.CharField(max_length=255, blank=True, null=True)
	last_update = models.DateTimeField(auto_now=True)
	class Meta:
		verbose_name = "Jawaban"
		verbose_name_plural = "Jawaban"

	def __str__(self):
		# self.text_jawaban
		return '%s-[%s]'%(self.text_jawaban[:30],self.jawaban_benar)
