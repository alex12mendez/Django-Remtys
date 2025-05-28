import json
from django.shortcuts import render, redirect
from REMTySprotesta.models import RegistroContraloria
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.forms import UserCreationForm
from django.contrib import messages
from django.http import JsonResponse
from django.core.serializers import serialize


from REMTySprotesta.models import (
    RegistroDerechosHumanos,
    RegistroAtencionCiudadana,
    RegistroDesarrolloEconomico,
    RegistroDesarrolloSocial,
    RegistroDifMunicipal,
    RegistroDireccionAdministracion,
    RegistroDireccionJuventud,
    RegistroDireccionMujeres,
    RegistroJuridicoConsultivo,
    RegistroObrasPublicas,
    RegistroOrdenamientoTerritorial,
    RegistroPrimeraSindicatura,
    RegistroProteccionCivil,
    RegistroSapasa,
    RegistroSecretariaAyuntamiento,
    RegistroSeguridadPublica,
    RegistroServiciosPublicos,
    RegistroTesoreriaMunicipal,
    RegistroTransparencia,
    RegistroVinculacionCiudadana,

)

def login_view(request): 
    if request.method =='POST': 
        username = request .POST.get('username') 
        password = request.POST.get('password') 
        user = authenticate(request, username=username, password=password) 

        if user is not None: 
            login(request, user) 
            return redirect('remtys') 

        else: 
            messages.error(request, 'Usuario o contrasefia incorrecto') 

    return render(request, 'remtys/login.html',      
)
    
def logout_view(request):
    logout(request)
    return redirect('remtys') 
    
def contraloria(request):
    registros = RegistroContraloria.objects.all()
    

    context = {
        'registros': registros,
        'user': request.user, 
    }
    
    return render(request, 'remtys/DOScontraloria_municipal.html', context)

def inicio(request):
    return render(request, 'remtys/inicio.html')  # tu template principal

def remtys(request):
    return render(request, 'remtys/remtys.html')  # tu template de remtys

def atencion(request):
    registros = RegistroAtencionCiudadana.objects.all()
    return render(request, 'remtys/DOSatencion_ciudadana.html', {'registros': registros})

def derechos_humanos(request):
    registros = RegistroDerechosHumanos.objects.all()
    return render(request, 'remtys/DOSderechos_humanos.html', {'registros': registros})


def desarrollo_economico(request):
    registros = RegistroDesarrolloEconomico.objects.all()
    return render(request, 'remtys/DOSdesarrollo_economico.html', {'registros': registros})

def desarrollo_social(request):
    registros = RegistroDesarrolloSocial.objects.all()
    return render(request, 'remtys/DOSdesarrollo_social.html', {'registros': registros})

def dif_municipal(request):
    registros = RegistroDifMunicipal.objects.all()
    return render(request, 'remtys/DOSdif_municipal.html', {'registros': registros})

def direccion_administracion(request):
    registros = RegistroDireccionAdministracion.objects.all()
    return render(request, 'remtys/DOSdireccion_administracion.html', {'registros': registros})

def direccion_juventud(request):
    registros = RegistroDireccionJuventud.objects.all()
    return render(request, 'remtys/DOSdireccion_juventud.html', {'registros': registros})

def direccion_mujeres(request):
    registros = RegistroDireccionMujeres.objects.all()
    return render(request, 'remtys/DOSdireccion_mujeres.html', {'registros': registros})

def juridico_consultivo(request):
    registros = RegistroJuridicoConsultivo.objects.all()
    return render(request, 'remtys/DOSjuridico_consultivo.html', {'registros': registros})

def obras_publicas(request):
    registros = RegistroObrasPublicas.objects.all()
    return render(request, 'remtys/DOSobras_publicas.html', {'registros': registros})

def ordenamiento_territorial(request):
    registros = RegistroOrdenamientoTerritorial.objects.all()
    return render(request, 'remtys/DOSordenamiento_territorial.html', {'registros': registros})

def primera_sindicatura(request):
    registros = RegistroPrimeraSindicatura.objects.all()
    return render(request, 'remtys/DOSprimera_sindicatura.html', {'registros': registros})

def proteccion_civil(request):
    registros = RegistroProteccionCivil.objects.all()
    return render(request, 'remtys/DOSproteccion_civil.html', {'registros': registros})

def sapasa(request):
    registros = RegistroSapasa.objects.all()
    return render(request, 'remtys/DOSSAPASA.html', {'registros': registros})

def secretaria_ayuntamiento(request):
    registros = RegistroSecretariaAyuntamiento.objects.all()
    return render(request, 'remtys/DOSsecretaria_ayuntamiento.html', {'registros': registros})

def seguridad_publica(request):
    registros = RegistroSeguridadPublica.objects.all()
    return render(request, 'remtys/DOSseguridad_publica.html', {'registros': registros})

def servicios_publicos(request):
    registros = RegistroServiciosPublicos.objects.all()
    return render(request, 'remtys/DOSservicios_publicos.html', {'registros': registros})

def tesoreria_municipal(request):
    registros = RegistroTesoreriaMunicipal.objects.all()
    return render(request, 'remtys/DOStesoreria_municipal.html', {'registros': registros})

def transparencia(request):
    registros = RegistroTransparencia.objects.all()
    return render(request, 'remtys/DOStransparencia.html', {'registros': registros})

def vinculacion_ciudadana(request):
    registros = RegistroVinculacionCiudadana.objects.all()
    return render(request, 'remtys/DOSvinculacion_ciudadana.html', {'registros': registros})









    # TABLAS, CEDULAS Y VISTAS
def TramitContraloria(request):
   
    return render(request, 'remtys/TramitesContraloria.html')
    
    