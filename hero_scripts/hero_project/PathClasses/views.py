from django.shortcuts import render
from rest_framework import (
    mixins, 
    generics, 
    viewsets,
    decorators,
    response,
)
from Feats import serializers as Ferial
from Feats import models as Fodels
from PathClasses import models, serializers
# Create your views here.
class ProficiencyViewSet(viewsets.ModelViewSet):
    queryset = models.Proficiency.objects.all()
    serializer_class = serializers.ProficiencySerializer
class PathClassArchetypeViewSet(viewsets.ModelViewSet):
    queryset = models.PathClassArchetype.objects.all()
    serializer_class = serializers.PathClassArchetypeSerializer   
class PathClassFeatureViewSet(viewsets.ModelViewSet):
    queryset = models.PathClassFeature.objects.all()
    serializer_class = serializers.PathClassFeatureSerializer
class PathClassViewSet(viewsets.ModelViewSet):
    queryset = models.PathClass.objects.all()
    serializer_class = serializers.PathClassSerializer
    @decorators.action(methods=['get'], detail=False, url_path='getIds', url_name='getIds')
    def getAncestryIds(self, request):
        queryset = self.queryset
        serializer = serializers.PathClassIdsSerializer(queryset, many=True)
        return response.Response(serializer.data)

    @decorators.action(methods=['get'], detail=True, url_path='getFeats', url_name='getFeats')
    def getFeats(self, request, pk=None):
        instance = self.get_object()
        qs = Fodels.Feat.objects.filter(id__in=instance.class_feats.all())
        serializer = Ferial.FeatIdsSerializer(qs, many=True)
        return response.Response(serializer.data)