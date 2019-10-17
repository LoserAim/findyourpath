from django.shortcuts import render
from rest_framework import mixins, generics, viewsets
from .models import Feat
from .serializers import FeatSerializer

# Create your views here.

class FeatViewSet(
    viewsets.ModelViewSet):
    queryset = Feat.objects.all()
    serializer_class = FeatSerializer



