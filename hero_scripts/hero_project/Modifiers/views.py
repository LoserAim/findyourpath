from django.shortcuts import render
from rest_framework import mixins, generics, viewsets
from .models import Modifier
from .serializers import ModifierSerializer
# Create your views here.
class ModifierViewSet(
    viewsets.ModelViewSet):
    queryset = Modifier.objects.all()
    serializer_class = ModifierSerializer