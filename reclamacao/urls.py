from django.conf.urls import url
from django.contrib import admin
from reclamacao.views import FazerReclamacaoView, EstatisticasView

urlpatterns = [
    url(r'^fazer-reclamacao/$', FazerReclamacaoView.as_view(), name='fazer_reclamacao'),

    url(r'^estatisticas/$', EstatisticasView.as_view(), name='estatisticas'),
]

