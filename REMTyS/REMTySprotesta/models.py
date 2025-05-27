from django.db import models

class RegistroContraloria(models.Model):
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField()
    estatus = models.CharField(max_length=50)

    class Meta:
        db_table = 'registros_contraloria'


class RegistroAtencionCiudadana(models.Model):
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField()
    estatus = models.CharField(max_length=50)
    fecha_creacion = models.DateTimeField()
    fecha_modificacion = models.DateTimeField()
    creado_por = models.CharField(max_length=100)
    modificado_por = models.CharField(max_length=100)
    activo = models.BooleanField()

    class Meta:
        db_table = 'registros_atencion_ciudadana'



class RegistroDerechosHumanos(models.Model):
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField()
    estatus = models.CharField(max_length=50)
    fecha_creacion = models.DateTimeField()
    fecha_modificacion = models.DateTimeField()
    creado_por = models.CharField(max_length=100)
    modificado_por = models.CharField(max_length=100)
    activo = models.BooleanField()

    class Meta:
        db_table = 'registros_derechos_humanos'

    def __str__(self):
        return self.nombre

class RegistroDesarrolloEconomico(models.Model):
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField()
    estatus = models.CharField(max_length=50)
    fecha_creacion = models.DateTimeField()
    fecha_modificacion = models.DateTimeField()
    creado_por = models.CharField(max_length=100)
    modificado_por = models.CharField(max_length=100)
    activo = models.BooleanField()

    class Meta:
        db_table = 'registros_desarrollo_economico'

    def __str__(self):
        return self.nombre

class RegistroDesarrolloSocial(models.Model):
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField()
    estatus = models.CharField(max_length=50)
    fecha_creacion = models.DateTimeField()
    fecha_modificacion = models.DateTimeField()
    creado_por = models.CharField(max_length=100)
    modificado_por = models.CharField(max_length=100)
    activo = models.BooleanField()

    class Meta:
        db_table = 'registros_desarrollo_social'

    def __str__(self):
        return self.nombre

class RegistroDifMunicipal(models.Model):
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField()
    estatus = models.CharField(max_length=50)
    fecha_creacion = models.DateTimeField()
    fecha_modificacion = models.DateTimeField()
    creado_por = models.CharField(max_length=100)
    modificado_por = models.CharField(max_length=100)
    activo = models.BooleanField()

    class Meta:
        db_table = 'registros_dif_municipal'

    def __str__(self):
        return self.nombre

class RegistroDireccionAdministracion(models.Model):
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField()
    estatus = models.CharField(max_length=50)
    fecha_creacion = models.DateTimeField()
    fecha_modificacion = models.DateTimeField()
    creado_por = models.CharField(max_length=100)
    modificado_por = models.CharField(max_length=100)
    activo = models.BooleanField()

    class Meta:
        db_table = 'registros_direccion_administracion'

    def __str__(self):
        return self.nombre

class RegistroDireccionJuventud(models.Model):
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField()
    estatus = models.CharField(max_length=50)
    fecha_creacion = models.DateTimeField()
    fecha_modificacion = models.DateTimeField()
    creado_por = models.CharField(max_length=100)
    modificado_por = models.CharField(max_length=100)
    activo = models.BooleanField()

    class Meta:
        db_table = 'registros_direccion_juventud'

    def __str__(self):
        return self.nombre

class RegistroDireccionMujeres(models.Model):
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField()
    estatus = models.CharField(max_length=50)
    fecha_creacion = models.DateTimeField()
    fecha_modificacion = models.DateTimeField()
    creado_por = models.CharField(max_length=100)
    modificado_por = models.CharField(max_length=100)
    activo = models.BooleanField()

    class Meta:
        db_table = 'registros_direccion_mujeres'

    def __str__(self):
        return self.nombre

class RegistroJuridicoConsultivo(models.Model):
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField()
    estatus = models.CharField(max_length=50)
    fecha_creacion = models.DateTimeField()
    fecha_modificacion = models.DateTimeField()
    creado_por = models.CharField(max_length=100)
    modificado_por = models.CharField(max_length=100)
    activo = models.BooleanField()

    class Meta:
        db_table = 'registros_juridico_consultivo'

    def __str__(self):
        return self.nombre

class RegistroObrasPublicas(models.Model):
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField()
    estatus = models.CharField(max_length=50)
    fecha_creacion = models.DateTimeField()
    fecha_modificacion = models.DateTimeField()
    creado_por = models.CharField(max_length=100)
    modificado_por = models.CharField(max_length=100)
    activo = models.BooleanField()

    class Meta:
        db_table = 'registros_obras_publicas'

    def __str__(self):
        return self.nombre

class RegistroOrdenamientoTerritorial(models.Model):
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField()
    estatus = models.CharField(max_length=50)
    fecha_creacion = models.DateTimeField()
    fecha_modificacion = models.DateTimeField()
    creado_por = models.CharField(max_length=100)
    modificado_por = models.CharField(max_length=100)
    activo = models.BooleanField()

    class Meta:
        db_table = 'registros_ordenamiento_territorial'

    def __str__(self):
        return self.nombre

class RegistroPrimeraSindicatura(models.Model):
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField()
    estatus = models.CharField(max_length=50)
    fecha_creacion = models.DateTimeField()
    fecha_modificacion = models.DateTimeField()
    creado_por = models.CharField(max_length=100)
    modificado_por = models.CharField(max_length=100)
    activo = models.BooleanField()

    class Meta:
        db_table = 'registros_primera_sindicatura'

    def __str__(self):
        return self.nombre

class RegistroProteccionCivil(models.Model):
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField()
    estatus = models.CharField(max_length=50)
    fecha_creacion = models.DateTimeField()
    fecha_modificacion = models.DateTimeField()
    creado_por = models.CharField(max_length=100)
    modificado_por = models.CharField(max_length=100)
    activo = models.BooleanField()

    class Meta:
        db_table = 'registros_proteccion_civil'

    def __str__(self):
        return self.nombre

class RegistroSapasa(models.Model):
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField()
    estatus = models.CharField(max_length=50)
    fecha_creacion = models.DateTimeField()
    fecha_modificacion = models.DateTimeField()
    creado_por = models.CharField(max_length=100)
    modificado_por = models.CharField(max_length=100)
    activo = models.BooleanField()

    class Meta:
        db_table = 'registros_sapasa'

    def __str__(self):
        return self.nombre

class RegistroSecretariaAyuntamiento(models.Model):
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField()
    estatus = models.CharField(max_length=50)
    fecha_creacion = models.DateTimeField()
    fecha_modificacion = models.DateTimeField()
    creado_por = models.CharField(max_length=100)
    modificado_por = models.CharField(max_length=100)
    activo = models.BooleanField()

    class Meta:
        db_table = 'registros_secretaria_ayuntamiento'

    def __str__(self):
        return self.nombre

class RegistroSeguridadPublica(models.Model):
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField()
    estatus = models.CharField(max_length=50)
    fecha_creacion = models.DateTimeField()
    fecha_modificacion = models.DateTimeField()
    creado_por = models.CharField(max_length=100)
    modificado_por = models.CharField(max_length=100)
    activo = models.BooleanField()

    class Meta:
        db_table = 'registros_seguridad_publica'

    def __str__(self):
        return self.nombre

class RegistroServiciosPublicos(models.Model):
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField()
    estatus = models.CharField(max_length=50)
    fecha_creacion = models.DateTimeField()
    fecha_modificacion = models.DateTimeField()
    creado_por = models.CharField(max_length=100)
    modificado_por = models.CharField(max_length=100)
    activo = models.BooleanField()

    class Meta:
        db_table = 'registros_servicios_publicos'

    def __str__(self):
        return self.nombre

class RegistroTesoreriaMunicipal(models.Model):
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField()
    estatus = models.CharField(max_length=50)
    fecha_creacion = models.DateTimeField()
    fecha_modificacion = models.DateTimeField()
    creado_por = models.CharField(max_length=100)
    modificado_por = models.CharField(max_length=100)
    activo = models.BooleanField()

    class Meta:
        db_table = 'registros_tesoreria_municipal'

    def __str__(self):
        return self.nombre

class RegistroTransparencia(models.Model):
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField()
    estatus = models.CharField(max_length=50)
    fecha_creacion = models.DateTimeField()
    fecha_modificacion = models.DateTimeField()
    creado_por = models.CharField(max_length=100)
    modificado_por = models.CharField(max_length=100)
    activo = models.BooleanField()

    class Meta:
        db_table = 'registros_transparencia'

    def __str__(self):
        return self.nombre

class RegistroVinculacionCiudadana(models.Model):
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField()
    estatus = models.CharField(max_length=50)
    fecha_creacion = models.DateTimeField()
    fecha_modificacion = models.DateTimeField()
    creado_por = models.CharField(max_length=100)
    modificado_por = models.CharField(max_length=100)
    activo = models.BooleanField()

    class Meta:
        db_table = 'registros_vinculacion_ciudadana'

    def __str__(self):
        return self.nombre