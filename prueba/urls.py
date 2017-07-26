from django.conf.urls import url, include
from django.conf.urls.static import static

from prueba import settings
from shop import views
from shop.views import ConsolaViewSet, GeneroViewSet, ItemViewSet, UsuarioViewSet, TipoViewSet, CarritoViewSet
from rest_framework.routers import SimpleRouter
from django.contrib import admin
from django.views.generic import TemplateView

router = SimpleRouter()
router.register(r'consola', ConsolaViewSet)
router.register(r'genero', GeneroViewSet)
router.register(r'item', ItemViewSet)
router.register(r'usuario', UsuarioViewSet)
router.register(r'tipo', TipoViewSet)
router.register(r'carrito', CarritoViewSet)

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^api/', include(router.urls)),
    url(r'^$', TemplateView.as_view(template_name="template.html"), name='index'),
]

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
