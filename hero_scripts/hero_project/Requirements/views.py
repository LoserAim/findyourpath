from django.shortcuts import render
from rest_framework import mixins, generics, viewsets
from .models import Requirement
from .serializers import RequirementSerializer
# Create your views here.
class RequirementViewSet(
    viewsets.GenericViewSet,
    mixins.RetrieveModelMixin, 
    mixins.CreateModelMixin, 
    mixins.ListModelMixin, 
    mixins.UpdateModelMixin,
    mixins.DestroyModelMixin,):
    queryset = Requirement.objects.all()
    serializer_class = RequirementSerializer