from django.conf.global_settings import MEDIA_ROOT
from django.core.validators import MinValueValidator
from django.db import models


class Consola(models.Model):
    idconsola = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=45)

    class Meta:
        managed = True
        db_table = 'consola'


class Genero(models.Model):
    idgenero = models.AutoField(primary_key=True)
    nombre = models.CharField(unique=True, max_length=45)

    class Meta:
        managed = True
        db_table = 'genero'


class Item(models.Model):
    iditem = models.AutoField(primary_key=True)
    nombre = models.CharField(unique=True, max_length=45)
    descripcion = models.TextField()
    precio = models.FloatField(validators=[MinValueValidator(0)])
    fecha_salida = models.DateField()
    imagen = models.ImageField(upload_to=MEDIA_ROOT + 'imagenes/', default=MEDIA_ROOT + 'imagenes/noimage.png', blank=False, null=False)
    generos_item = models.ManyToManyField(Genero, blank=False)
    consolas_item = models.ManyToManyField(Consola, blank=False)

    class Meta:
        managed = True
        db_table = 'item'


class Carrito(models.Model):
    idcarrito = models.AutoField(primary_key=True)
    items_carrito = models.ManyToManyField(Item, blank=True)

    class Meta:
        managed = True
        db_table = 'carrito'


class Tipo(models.Model):
    idtipo = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=45)

    class Meta:
        managed = True
        db_table = 'tipo'


class Usuario(models.Model):
    idusuario = models.AutoField(primary_key=True)
    usuario = models.CharField(unique=True, max_length=15, null=False, blank=False)
    nombre = models.CharField(max_length=45)
    apellido = models.CharField(max_length=45)
    correo = models.CharField(max_length=45)
    password = models.CharField(max_length=45)
    dinero = models.FloatField(default=10000, validators=[MinValueValidator(0)])
    tipo_idtipo = models.ForeignKey(Tipo, models.DO_NOTHING, db_column='tipo_idtipo')
    carrito_idcarrito = models.ForeignKey(Carrito, models.DO_NOTHING, db_column='carrito_idcarrito', blank=True,
                                          null=True)
    items = models.ManyToManyField(Item, blank=True)

    class Meta:
        managed = True
        db_table = 'usuario'
