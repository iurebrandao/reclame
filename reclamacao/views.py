from django.contrib import messages
from django.contrib.auth.mixins import LoginRequiredMixin
from django.core.exceptions import ObjectDoesNotExist, MultipleObjectsReturned
from django.shortcuts import redirect
from django.urls import reverse
from django.views.generic import FormView
from django_filters.views import FilterView

from reclamacao.forms import ReclamacaoForm, EstatisticasForm
from reclamacao.models import Reclamacao
from usuario.models import Usuario


class FazerReclamacaoView(LoginRequiredMixin, FormView):
    template_name = 'reclamacao/fazer_reclamacao.html'
    form_class = ReclamacaoForm

    def get_context_data(self, **kwargs):
        context = super(FazerReclamacaoView, self).get_context_data(
            **kwargs)
        return context

    def form_valid(self, form):
        form.save()

        messages.add_message(
            self.request,
            messages.SUCCESS,
            'Reclamação registrada com sucesso!')

        return redirect(reverse('inicio'))

    def post(self, request, *args, **kwargs):
        form_class = self.get_form_class()
        form = self.get_form(form_class)

        if form.is_valid():

            reclamacao = form.save(commit=False)

            # Por precaução testa se existe exatamente um usuário
            # relacionado ao user que fez o login
            try:
                reclamacao.usuario = Usuario.objects.get(
                    user=self.request.user)
            except ObjectDoesNotExist:
                raise Exception('Usuário inexistente')
            except MultipleObjectsReturned:
                raise Exception('Existe mais de um usuário correspondente' +
                                ' ao user autenticado.')

            reclamacao.problema = form.cleaned_data['problema']
            reclamacao.ambiente = form.cleaned_data['ambiente']
            reclamacao.cidade = form.cleaned_data['cidade']
            reclamacao.descricao = form.cleaned_data['descricao']
            reclamacao.tema = form.cleaned_data['tema']

            reclamacao.save()
            return self.form_valid(form)

        else:
            # Cria uma string com os problemas apontados
            # pela validação dos campos
            erros = form.non_field_errors().as_text()
            erros = ''.join(c for c in erros if c not in '*')

            # Adiciona mensagem de erro ao contexto e esta será
            # renderizada no html
            mensagem = 'Formulário Inválido.' + erros
            messages.add_message(request, messages.ERROR, mensagem)

            return self.render_to_response(
                {'form': form})


class EstatisticasView(LoginRequiredMixin, FilterView):

    model = Reclamacao
    filterset_class = EstatisticasForm
    template_name = 'reclamacao/estatisticas.html'

    def get_context_data(self, **kwargs):
        return super(EstatisticasView,self).get_context_data(**kwargs)

    def get(self, request, *args, **kwargs):
        super(EstatisticasView, self).get(request)

        data = self.filterset.data
        if data:
            url = "&" + str(self.request.environ['QUERY_STRING'])
        else:
            url = ''
            queryset = []

        if url:
            queryset = self.object_list.filter()

        lista_pontos = []

        for o in queryset:
            dict_pontos = {}
            dict_pontos['lat'] = o.cidade.latitude
            dict_pontos['lng'] = o.cidade.longitude
            lista_pontos.append(dict_pontos)

        context = self.get_context_data(filter=self.filterset,
                                        object_list=queryset,
                                        filter_url=url,
                                        numero_res=len(queryset),
                                        lista_pontos=lista_pontos
                                        )

        return self.render_to_response(context)
