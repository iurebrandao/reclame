# -*- coding: utf-8 -*-
import base64
import os
import magic
import six
import uuid

from django.conf import settings
from django.core.files.base import ContentFile
from django.core.files.uploadhandler import MemoryFileUploadHandler
from django.forms import ValidationError

from crispy_forms.bootstrap import FormActions
from crispy_forms.layout import Div, Submit

from PIL import Image

from rest_framework import serializers

from io import BytesIO

# try:
#     from os.cStringIO import StringIO
# except ImportError:
#     from os.StringIO import StringIO


def from_to(start, end):
    return list(range(start, end + 1))


def make_pagination(index, num_pages):
    '''Make a list of adjacent page ranges interspersed with "None"s
    The list starts with [1, 2] and end with [num_pages-1, num_pages].
    The list includes [index-1, index, index+1]
    "None"s separate those ranges and mean ellipsis (...)
    Example:  [1, 2, None, 10, 11, 12, None, 29, 30]
    '''

    pagination_length = 10
    if num_pages <= pagination_length:
        return from_to(1, num_pages)
    else:
        if index - 1 <= 5:
            tail = [num_pages - 1, num_pages]
            head = from_to(1, pagination_length - 3)
        else:
            if index + 1 >= num_pages - 3:
                tail = from_to(index - 1, num_pages)
            else:
                tail = [index - 1, index, index + 1,
                        None, num_pages - 1, num_pages]
            head = from_to(1, pagination_length - len(tail) - 1)
        return head + [None] + tail


def to_column(name_span):
    fieldname, span = name_span
    return Div(fieldname, css_class='col-md-%d' % span)


def to_row(names_spans):
    return Div(*map(to_column, names_spans), css_class='row-fluid')


def form_actions(more=[], save_label='Salvar'):
    return FormActions(
        Submit('salvar',
               save_label,
               css_class='btn btn-info btn-lg pull-right'), *more)
