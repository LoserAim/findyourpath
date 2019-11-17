from django.shortcuts import render
from rest_framework import (
    mixins, 
    generics, 
    viewsets,
    decorators,
    response,
)
from Actions import models, serializers


class ActionViewSet(viewsets.ModelViewSet):
    queryset = models.Action.objects.all()
    serializer_class = serializers.ActionSerializer