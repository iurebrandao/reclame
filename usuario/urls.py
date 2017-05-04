from django.conf.urls import url
from django.contrib.auth.views import (logout)

from usuario.views import LoginView, CadastrarUsuarioView

urlpatterns = [

    url(r'^login/$', LoginView.as_view(), name='login'),

    url(r'^logout/$', logout, {'next_page': 'login'}, name='logout'),

    url(r'^cadastrar-usuario/$', CadastrarUsuarioView.as_view(), name='cadastrar_usuario'),
]
