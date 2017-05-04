import django_filters

from crispy_forms.helper import FormHelper
from crispy_forms.layout import Fieldset, Layout
from django.forms import ModelForm
from django import forms
from reclame.utils import to_row, form_actions

from reclamacao.models import Tema, Problema, Ambiente, Cidade, Reclamacao


class ReclamacaoForm(ModelForm):

    tema = forms.ModelChoiceField(
        label='Selecione o tema',
        required=True,
        queryset=Tema.objects.all().order_by('tema'),
        widget=forms.Select(
            attrs={'class': 'selector'}))

    cidade = forms.ModelChoiceField(
        label='Selecione a cidade',
        required=True,
        queryset=Cidade.objects.all().order_by('nome'),
        widget=forms.Select(
            attrs={'class': 'selector'}))

    ambiente = forms.ModelChoiceField(
        label='Selecione o ambiente',
        required=True,
        queryset=Ambiente.objects.all().order_by('ambiente'),
        widget=forms.Select(
            attrs={'class': 'selector'}))

    problema = forms.ModelChoiceField(
        label='Selecione o problema',
        required=True,
        queryset=Problema.objects.all().order_by('problema'),
        widget=forms.Select(
            attrs={'class': 'selector'}))

    descricao = forms.CharField(
        label='Descrição',
        widget=forms.Textarea(
            attrs={'rows': 15,
                   'cols': 48,
                   'spellcheck': 'True',
                   'lang': 'pt-BR',
                   'placeholder': 'Escreva aqui a descrição da reclamação'}),
        required=True)

    class Meta:
        model = Reclamacao
        fields = ['tema',
                  'cidade',
                  'problema',
                  'descricao',
                  'ambiente']


class EstatisticasForm(django_filters.FilterSet):

    tema = django_filters.ModelChoiceFilter(
        label='Tema',
        required=False,
        queryset=Tema.objects.all().order_by('tema'),
        empty_label='Selecione')

    class Meta:
        model = Reclamacao
        fields = ['tema']

    def __init__(self, *args, **kwargs):
        super(EstatisticasForm, self).__init__(*args, **kwargs)

        row1 = to_row(
            [('tema', 6)])

        self.form.helper = FormHelper()
        self.form.helper.form_method = 'GET'
        self.form.helper.layout = Layout(
            Fieldset('Filtragem de Estatisticas'),
            row1,
            form_actions(save_label='Filtrar'))
