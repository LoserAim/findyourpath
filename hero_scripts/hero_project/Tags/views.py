from django.shortcuts import render
from rest_framework import viewsets, mixins
from Tags import models, serializers
# Create your views here.
class TagsViewSet(
    viewsets.ModelViewSet, 
    ):
    queryset = models.Tag.objects.all()
    serializer_class = serializers.TagSerializer