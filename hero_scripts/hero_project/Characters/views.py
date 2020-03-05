from django.shortcuts import render
from rest_framework import (
    mixins, 
    generics, 
    viewsets,
    decorators,
    response,
)
from Characters import models, serializers


# Create your views here.

class AbilityScoresViewSet(viewsets.ModelViewSet):
    queryset = models.AbilityScores.objects.all()
    serializer_class = serializers.AbilityScoresSerializer

class CharacterViewSet(viewsets.ModelViewSet):
    queryset = models.Character.objects.all()
    serializer_class = serializers.CharacterSerializer
    @decorators.action(methods=['get'], detail=False, url_path='getIds', url_name='getIds')
    def getCharacterIds(self, request):
        queryset = self.queryset
        serializer = serializers.CharacterIdsSerializer(queryset, many=True)
        return response.Response(serializer.data)