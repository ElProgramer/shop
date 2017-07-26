from rest_framework import serializers
from rest_framework.serializers import ModelSerializer

from shop.models import Consola, Genero, Item, Usuario, Tipo, Carrito


class ConsolaSerializer(ModelSerializer):
    class Meta:
        model = Consola
        fields = ('idconsola', 'nombre')


class GeneroSerializer(ModelSerializer):
    class Meta:
        model = Genero
        fields = ('idgenero', 'nombre')


class TipoSerializer(ModelSerializer):
    class Meta:
        model = Tipo
        fields = ('idtipo', 'nombre')


class ItemSerializer(ModelSerializer):
    generos_item = GeneroSerializer(many=True, read_only=True)
    generos_ids = serializers.PrimaryKeyRelatedField(many=True, read_only=False, queryset=Genero.objects.all(),
                                                     source='generos_item')
    consolas_ids = serializers.PrimaryKeyRelatedField(many=True, read_only=False, queryset=Consola.objects.all(),
                                                      source='consolas_item')
    consolas_item = ConsolaSerializer(many=True, read_only=True)

    class Meta:
        model = Item
        fields = (
            'iditem', 'nombre', 'descripcion', 'precio', 'fecha_salida', 'imagen', 'generos_ids', 'consolas_ids',
            'generos_item', 'consolas_item',)


class UsuarioSerializer(ModelSerializer):
    lista_items = ItemSerializer(many=True, read_only=True, source='items')

    class Meta:
        model = Usuario
        fields = ('idusuario', 'usuario', 'nombre', 'apellido', 'correo', 'password', 'dinero', 'tipo_idtipo',
                  'carrito_idcarrito', 'items', 'lista_items')


class CarritoSerializer(ModelSerializer):
    items = ItemSerializer(many=True, read_only=True, source='items_carrito')

    class Meta:
        model = Carrito
        fields = ('idcarrito', 'items_carrito', 'items')
