from django.forms import MultipleChoiceField
from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet
import django_filters


# Create your views here.
from shop.models import Consola, Genero, Item, Usuario, Tipo, Carrito
from shop.serializers import ConsolaSerializer, GeneroSerializer, ItemSerializer, UsuarioSerializer, TipoSerializer, \
    CarritoSerializer


class MultipleField(MultipleChoiceField):
    def valid_value(self, value):
        return True


class MultipleFilter(django_filters.MultipleChoiceFilter):
    field_class = MultipleField


class ConsolaViewSet(ModelViewSet):
    queryset = Consola.objects.all()
    serializer_class = ConsolaSerializer


class GeneroViewSet(ModelViewSet):
    queryset = Genero.objects.all().order_by('idgenero')
    serializer_class = GeneroSerializer


class ItemFilter(django_filters.FilterSet):
    class Meta:
        model = Item
        fields = {
            'nombre': ['icontains'],
            'generos_item': ['exact'],
            'consolas_item': ['exact']
        }


class UsuarioFilter(django_filters.FilterSet):
    class Meta:
        model = Usuario
        fields = {
            'usuario': ['exact'],
            'password': ['exact']
        }

class StandardResultsSetPagination(PageNumberPagination):
    page_size = 10
    page_size_query_param = 'page_size'
    max_page_size = 10000

    def get_paginated_response(self, data):
        return Response({

            'next': self.get_next_link(),
            'previous': self.get_previous_link(),
            'count': self.page.paginator.count,
            'total_pages': self.page.paginator.num_pages,
            'results': data
        })


class ItemViewSet(ModelViewSet):
    queryset = Item.objects.all()
    serializer_class = ItemSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)
    filter_class = ItemFilter
    #   pagination_class = StandardResultsSetPagination


class UsuarioViewSet(ModelViewSet):
    queryset = Usuario.objects.all()
    serializer_class = UsuarioSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)
    filter_class = UsuarioFilter
    # pagination_class = StandardResultsSetPagination


class TipoViewSet(ModelViewSet):
    queryset = Tipo.objects.all()
    serializer_class = TipoSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)


class CarritoViewSet(ModelViewSet):
    queryset = Carrito.objects.all()
    serializer_class = CarritoSerializer
    filter_backends = (django_filters.rest_framework.DjangoFilterBackend,)
