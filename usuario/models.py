from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User, Group
from django.core.exceptions import ObjectDoesNotExist


def grupo_usuario_comum():
    try:
        grupo = Group.objects.get(name='Usuário Comum')
    except ObjectDoesNotExist:
        raise
    else:
        return grupo.id


class Usuario(models.Model):

    id = models.AutoField(db_column='ID', primary_key=True)

    user = models.OneToOneField(User, default="", verbose_name='Usuário')

    username = models.CharField(
        max_length=45,
        unique=True,
        default="",
        verbose_name='Nome de Usuário')

    nome = models.CharField(
        max_length=45,
        verbose_name='Nome Completo')

    cpf = models.CharField(
        db_column='CPF',
        max_length=15,
        unique=True,
        verbose_name='CPF')

    sexo = models.CharField(
        max_length=1,
        default='',
        choices=(('M', 'Masculino'),
                 ('F', 'Feminino'),
                 ('O', 'Outro')),
        verbose_name='Sexo')

    email = models.EmailField(
        max_length=254,
        unique=True,
        verbose_name='E-mail')

    data_nasc = models.DateField(
        default='2000-01-01',
        verbose_name='Data de Nascimento')

    senha = models.CharField(
        max_length=128)

    grupo_usuario = models.ForeignKey(
        Group,
        verbose_name='Tipo de Usuário',
        default=grupo_usuario_comum)

    class Meta:
        verbose_name = 'Usuário'
        verbose_name_plural = 'Usuários'

    def __str__(self):
        return self.nome
