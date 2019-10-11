from django.shortcuts import render
from rest_framework import mixins, generics, viewsets
from .models import Feat, ReqSkill
from .serializers import FeatSerializer, ReqSkillSerializer
from rest_framework.response import Response
from django.shortcuts import get_object_or_404
# Create your views here.

class FeatViewSet(
    viewsets.ModelViewSet):
    queryset = Feat.objects.all()
    serializer_class = FeatSerializer


class ReqSkillViewSet(
    viewsets.ModelViewSet):
    queryset = ReqSkill.objects.all()
    serializer_class = ReqSkillSerializer

