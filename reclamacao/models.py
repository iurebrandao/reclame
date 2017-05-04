from django.db import models

from usuario.models import Usuario


class Tema (models.Model):

    id = models.AutoField(db_column='id', primary_key=True)

    tema = models.CharField(
        max_length=200,
        verbose_name='Tema')

    class Meta:
        verbose_name = 'Tema'
        verbose_name_plural = 'Temas'

    def __str__(self):
        return self.tema


class Cidade (models.Model):

    id = models.AutoField(db_column='id', primary_key=True)

    nome = models.CharField(
        max_length=200,
        verbose_name='Nome da Cidade')

    latitude = models.FloatField(verbose_name='Latitude')
    longitude = models.FloatField(verbose_name='Longitude')

    class Meta:
        verbose_name = 'Cidade'
        verbose_name_plural = 'Cidades'

    def __str__(self):
        return self.nome


class Ambiente (models.Model):

    id = models.AutoField(db_column='id', primary_key=True)

    ambiente = models.CharField(
        max_length=200,
        verbose_name='Ambiente')

    class Meta:
        verbose_name = 'Ambiente'
        verbose_name_plural = 'Ambientes'

    def __str__(self):
        return self.ambiente


class Problema (models.Model):

    id = models.AutoField(db_column='id', primary_key=True)

    problema = models.CharField(
        max_length=200,
        verbose_name='Problema')

    class Meta:
        verbose_name = 'Problema'
        verbose_name_plural = 'Problemas'

    def __str__(self):
        return self.problema


class Reclamacao(models.Model):

    id = models.AutoField(db_column='id', primary_key=True)

    tema = models.ForeignKey(
        Tema,
        verbose_name='Tema')

    cidade = models.ForeignKey(
        Cidade,
        verbose_name='Cidade')

    ambiente = models.ForeignKey(
        Ambiente,
        verbose_name='Ambiente')

    problema = models.ForeignKey(
        Problema,
        verbose_name='Problema')

    descricao = models.TextField(verbose_name='Descrição')

    usuario = models.ForeignKey(Usuario,
                                related_name='usuario_usuario',
                                verbose_name='Usuário')

    class Meta:
        verbose_name = 'Reclamação'
        verbose_name_plural = 'Reclamações'

    def __str__(self):
        return self.descricao
