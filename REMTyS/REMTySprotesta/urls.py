# REMTySprotesta/urls.py

from django.urls import path
from . import views
from django.views.generic import RedirectView
# REMTySprotesta/urls.py


urlpatterns = [
    path('', views.remtys, name='inicio'),
  #  path('remtys/', views.remtys, name='remtys'),
    path('DOSatencion_ciudadana/', views.atencion, name='DOSatencion_ciudadana'),
    path('DOScontraloria_municipal/', views.contraloria, name='DOScontraloria_municipal'),
    path('DOSproteccion_civil/', views.proteccion_civil, name='DOSproteccion_civil'),
    path('DOSderechos_humanos/', views.derechos_humanos, name='DOSderechos_humanos'),
    path('DOSdif_municipal/', views.dif_municipal, name='DOSdif_municipal'),
    path('DOSdireccion_administracion/', views.direccion_administracion, name='DOSdireccion_administracion'),
    path('DOSdesarrollo_economico/', views.desarrollo_economico, name='DOSdesarrollo_economico'),
    path('DOSdesarrollo_social/', views.desarrollo_social, name='DOSdesarrollo_social'),
    path('DOSjuridico_consultivo/', views.juridico_consultivo, name='DOSjuridico_consultivo'),
    path('DOSdireccion_juventud/', views.direccion_juventud, name='DOSdireccion_juventud'),
    path('DOSobras_publicas/', views.obras_publicas, name='DOSobras_publicas'),
    path('DOSordenamiento_territorial/', views.ordenamiento_territorial, name='DOSordenamiento_territorial'),
    path('DOSseguridad_publica/', views.seguridad_publica, name='DOSseguridad_publica'),
    path('DOSservicios_publicos/', views.servicios_publicos, name='DOSservicios_publicos'),
    path('DOSvinculacion_ciudadana/', views.vinculacion_ciudadana, name='DOSvinculacion_ciudadana'),
    path('DOSdireccion_mujeres/', views.direccion_mujeres, name='DOSdireccion_mujeres'),
    path('DOSprimera_sindicatura/', views.primera_sindicatura, name='DOSprimera_sindicatura'),
    path('DOSsapasa/', views.sapasa, name='DOSsapasa'),
    path('DOSsecretaria_ayuntamiento/', views.secretaria_ayuntamiento, name='DOSsecretaria_ayuntamiento'),
    path('DOStesoreria_municipal/', views.tesoreria_municipal, name='DOStesoreria_municipal'),
    path('DOStransparencia/', views.transparencia, name='DOStransparencia'),
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),
    path('home/', views.remtys, name='home'),
    
    
    
    path('TramitesContraloria/', views.TramitContraloria, name='TramitesContraloria'),
]