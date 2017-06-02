from django.contrib import messages
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.models import User
from django.contrib.auth.views import login
from django.db import transaction
from django.http import HttpResponse, Http404
from django.shortcuts import redirect
from django.urls import reverse
from django.views import View
from django.views.generic import FormView

from usuario.forms import LoginForm, UsuarioForm, EditarPerfilForm
from usuario.models import Usuario


class LoginView(View):

    template_name = 'usuario/login.html'
    authentication_form = LoginForm
    success_url = 'inicio'

    def get(self, request):
        return login(request=request, template_name=self.template_name,
                     authentication_form=self.authentication_form)

    def post(self, request):
        return login(request=request, template_name=self.template_name,
                     authentication_form=self.authentication_form)


class CadastrarUsuarioView(FormView):

    template_name = "usuario/cadastrar_usuario.html"
    form_class = UsuarioForm
    success_url = 'login'

    def get_context_data(self, **kwargs):
        if self.request.user.is_active:
            raise Http404
        context = super(CadastrarUsuarioView, self).get_context_data(
            **kwargs)
        return context

    @transaction.atomic
    def form_valid(self, form):
        kwargs = {}
        form.save()
        user = User.objects.get(username=self.request.POST.get('username'))
        usuario = Usuario.objects.get(user=user)

        user.save()
        usuario.save()

        return redirect(reverse(self.get_success_url()))

    def post(self, request, *args, **kwargs):
        form_class = self.get_form_class()
        form = self.get_form(form_class)

        if form.is_valid():
            return self.form_valid(form)
        else:
            erros = form.non_field_errors().as_text()
            erros = ''.join(c for c in erros if c not in '*')
            mensagem = 'Formulário Inválido.' + erros
            messages.add_message(request, messages.ERROR, mensagem)
            return self.render_to_response(
                {'form': form})


class EditarPerfilView(LoginRequiredMixin, FormView):

    template_name = "usuario/editar_perfil.html"
    form_class = EditarPerfilForm
    success_url = 'inicio'

    @transaction.atomic
    def form_valid(self, form):
        kwargs = {}
        form.save()
        user = User.objects.get(username=self.request.POST.get('username'))
        usuario = Usuario.objects.get(user=user)

        user.save()
        usuario.save()

        return redirect(reverse(self.get_success_url()))

    def post(self, request, *args, **kwargs):
        form_class = self.get_form_class()
        form = self.get_form(form_class)

        if form.is_valid():
            return self.form_valid(form)
        else:
            erros = form.non_field_errors().as_text()
            erros = ''.join(c for c in erros if c not in '*')
            mensagem = 'Formulário Inválido.' + erros
            messages.add_message(request, messages.ERROR, mensagem)
            return self.render_to_response(
                {'form': form})



