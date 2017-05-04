from django.contrib import admin
from reclamacao.models import Tema, Problema, Ambiente, Cidade, Reclamacao


class ReclamacaoAdmin(admin.ModelAdmin):

    fields = ['tema',
              'problema',
              'ambiente',
              'cidade',
              'descricao',
              'usuario']

    search_fields = ['tema',
                     'problema',
                     'ambiente',
                     'cidade',
                     'descricao',
                     'usuario']

    list_display = ['tema',
                    'problema',
                    'ambiente',
                    'cidade',
                    'descricao',
                    'usuario']

admin.site.register(Reclamacao, ReclamacaoAdmin)
admin.site.register(Tema)
admin.site.register(Problema)
admin.site.register(Ambiente)
admin.site.register(Cidade)