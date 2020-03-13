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



class CharacterViewSet(viewsets.ModelViewSet):
    queryset = models.Character.objects.all()
    serializer_class = serializers.CharacterSerializer
    @decorators.action(methods=['get'], detail=False, url_path='getIds', url_name='getIds')
    def getCharacterIds(self, request):
        queryset = self.queryset
        serializer = serializers.CharacterIdsSerializer(queryset, many=True)
        return response.Response(serializer.data)
    @decorators.action(methods=['get'], detail=True, url_path='getFull', url_name='getFull')
    def getCharacterIds(self, request, pk=None):
        instance = self.get_object()
        serializer = serializers.CharacterFullSerializer(instance, many=False)
        return response.Response(serializer.data)