import datetime

from django.contrib.auth.forms import AuthenticationForm, UsernameField
from django import forms
from django.contrib.auth.models import User, Group
from django.db import transaction
from django.forms import ModelForm, ValidationError
from django.contrib.auth.password_validation import validate_password
from usuario.models import Usuario


class LoginForm(AuthenticationForm):
    username = UsernameField(
        label='',
        max_length=254,
        widget=forms.TextInput(attrs={'class': 'form-control', 'autofocus': True}),
    )

    password = forms.CharField(
        label='',
        max_length=30,
        widget=forms.PasswordInput(
            attrs={'class': 'form-control', 'name': 'password'}))


class UsuarioForm(ModelForm):

    senha = forms.CharField(
        max_length=45,
        label='Senha',
        widget=forms.PasswordInput(attrs={'class': 'form-control'}))

    confirma_senha = forms.CharField(
        max_length=45,
        label='Confirmar Senha',
        widget=forms.PasswordInput(attrs={'class': 'form-control'}))

    sexo = forms.ChoiceField(
        choices=[('', '--------'),
                 ('M', 'Masculino'),
                 ('F', 'Feminino'),
                 ('O', 'Outro')],
        widget=forms.Select(
            attrs={'class': 'form-control'}),
        required=True)

    class Meta:
        model = Usuario
        fields = ['username',
                  'email',
                  'nome',
                  'senha',
                  'confirma_senha',
                  'cpf',
                  'sexo',
                  'data_nasc']
        widgets = {'grupo_usuario': forms.HiddenInput()}

    def valida_igualdade(self, texto1, texto2, msg):
        if texto1 != texto2:
            raise ValidationError(msg)
        return True

    def clean(self):

        # Validação de Senha
        if ('senha' not in self.cleaned_data or 'confirma_senha' not in self.cleaned_data):
            raise ValidationError(
                'Favor preencher o campo senha e o de confirmação.')

        msg = 'As senhas não conferem.'
        self.valida_igualdade(
            self.cleaned_data['senha'],
            self.cleaned_data['confirma_senha'],
            msg)

        try:
            validate_password(self.cleaned_data['senha'])
        except ValidationError as error:
            raise ValidationError(error)

        # Validação de Email Existente
        email_existente1 = Usuario.objects.filter(
            email=self.cleaned_data['email']).exists()

        email_existente2 = User.objects.filter(
            email=self.cleaned_data['email']).exists()

        if (email_existente1 or email_existente2):
            msg = 'Esse email já foi cadastrado.'
            raise ValidationError(msg)

        if ('cpf' in self.cleaned_data):
            # Validação de CPF
            if (self.cleaned_data['cpf']):
                if (len(self.cleaned_data['cpf'])) != 14:
                    raise ValidationError('CPF inválido.')

            if (self.cleaned_data['cpf'] and
                    Usuario.objects.filter(cpf=self.cleaned_data['cpf']).exists()):
                raise ValidationError('CPF já existente.')
        else:
            raise ValidationError('Preencha o campo CPF')

        # Validação de Data de Nascimento
        if (self.cleaned_data['data_nasc']):
            if (self.cleaned_data['data_nasc'] > datetime.datetime.now().date()):
                raise ValidationError(
                    'Você não pode ter nascido no futuro!')

        return self.cleaned_data

    @transaction.atomic
    def save(self, commit=False):
        usuario = super(UsuarioForm, self).save(commit)

        u = User.objects.create(
            username=usuario.username,
            email=usuario.email)

        u.set_password(self.cleaned_data['senha'])

        u.save()

        usuario.user = u
        usuario.senha = 'sadIODOAS@(*@!(@!*#DSAUHAS'

        usuario.save()

        grupo = Group.objects.get(name='Usuário Comum')
        u.groups.add(grupo)

        return usuario

    def __init__(self, *args, **kwargs):
        super(UsuarioForm, self).__init__(*args, **kwargs)
        self.fields['cpf'].widget.attrs['class'] = 'form-control'
        self.fields['username'].widget.attrs['class'] = 'form-control'
        self.fields['nome'].widget.attrs['class'] = 'form-control'
        self.fields['email'].widget.attrs['class'] = 'form-control'
        self.fields['data_nasc'].widget.attrs['class'] = 'form-control'
        self.fields['data_nasc'].initial = ''


class EditarPerfilForm(ModelForm):

    sexo = forms.ChoiceField(
        choices=[('', '--------'),
                 ('M', 'Masculino'),
                 ('F', 'Feminino'),
                 ('O', 'Outro')],
        widget=forms.Select(
            attrs={'class': 'form-control'}),
        required=True)

    class Meta:
        model = Usuario
        fields = ['email',
                  'nome',
                  'sexo',
                  'data_nasc']
        widgets = {'grupo_usuario': forms.HiddenInput()}

    def valida_igualdade(self, texto1, texto2, msg):
        if texto1 != texto2:
            raise ValidationError(msg)
        return True

    def clean(self):

        # Validação de Email Existente
        email_existente1 = Usuario.objects.filter(
            email=self.cleaned_data['email']).exists()

        email_existente2 = User.objects.filter(
            email=self.cleaned_data['email']).exists()

        if (email_existente1 or email_existente2):
            msg = 'Esse email já foi cadastrado.'
            raise ValidationError(msg)

        # Validação de Data de Nascimento
        if (self.cleaned_data['data_nasc']):
            if (self.cleaned_data['data_nasc'] > datetime.datetime.now().date()):
                raise ValidationError(
                    'Você não pode ter nascido no futuro!')

        return self.cleaned_data

    @transaction.atomic
    def save(self, commit=False):
        usuario = super(EditarPerfilForm, self).save(commit)

        u = User.objects.create(
            username=usuario.username,
            email=usuario.email)

        u.save()

        usuario.user = u

        usuario.save()

        grupo = Group.objects.get(name='Usuário Comum')
        u.groups.add(grupo)

        return usuario

    def __init__(self, *args, **kwargs):
        super(EditarPerfilForm, self).__init__(*args, **kwargs)
        self.fields['nome'].widget.attrs['class'] = 'form-control'
        self.fields['email'].widget.attrs['class'] = 'form-control'
        self.fields['data_nasc'].widget.attrs['class'] = 'form-control'
        self.fields['data_nasc'].initial = ''

