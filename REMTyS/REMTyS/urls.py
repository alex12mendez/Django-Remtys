"""
URL configuration for REMTyS project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.2/topics/http/urls/
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
from django.urls import path, include 
from django.views.generic import RedirectView
from django.conf import settings
from django.conf.urls.static import static
from REMTySprotesta import views


urlpatterns = [
    path('admin/', admin.site.urls),
    path('inicio/', include('REMTySprotesta.urls')),  # Tu app bajo /inicio/
    path('', RedirectView.as_view(url='/inicio/', permanent=False)),  # Raíz redirige a /inicio/
    # ejemplo de urls.py
    path('contraloria/', views.contraloria, name='contraloria'),
]
if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)