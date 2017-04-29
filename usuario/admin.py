from django.contrib import admin

from .models import Usuario

admin.site.register(Usuario)

class UsuarioAdmin(admin.ModelAdmin):
    ordering = ('email',)

    fields = ['email',
              'nome',
              'senha',
              'cpf',
              'rg',
              'sexo',
              'data_nasc',
              'grupo_usuario']

    search_fields = ['nome',
                     'email',
                     'cpf',
                     'rg']
    list_display = ['email',
                    'nome',
                    'sexo',
                    'data_nasc',
                    'grupo_usuario']

    actions = None