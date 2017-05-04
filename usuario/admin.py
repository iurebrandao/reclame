from django.contrib import admin

from .models import Usuario
from django.contrib.auth.models import User, Group


class UsuarioAdmin(admin.ModelAdmin):

    fields = ['username',
              'email',
              'nome',
              'senha',
              'cpf',
              'sexo',
              'data_nasc',
              'grupo_usuario']

    search_fields = ['username',
                     'nome',
                     'email',
                     'cpf']
    list_display = ['username',
                    'email',
                    'nome',
                    'sexo',
                    'data_nasc',
                    'grupo_usuario']

    actions = None

    def save_model(self, request, obj, form, change):
        if obj.pk:
            user = User.objects.get(usuario__id=obj.pk)
        else:
            user = User.objects.create(
                username=obj.username,
                email=obj.email)
            user.set_password(obj.senha)

        grupo = Group.objects.get(name=obj.grupo_usuario.name)
        if grupo in user.groups.all():
            pass
        else:
            for g in user.groups.all():
                user.groups.remove(g)
            user.groups.add(grupo)

        user.save()

        obj.senha = 'sadIODOAS@(*@!(@!*#DSAUHAS'
        obj.user = user
        obj.grupo_usuario = grupo
        obj.save()

admin.site.register(Usuario, UsuarioAdmin)
admin.site.site_title = 'Administração - Reclamé'
admin.site.site_header = 'Administração - Reclamé'
