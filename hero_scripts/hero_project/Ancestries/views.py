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
from Ancestries import models, serializers


class Ability_Boost_FlawViewSet(viewsets.ModelViewSet):
    queryset = models.Ability_Boost_Flaw.objects.all()
    serializer_class = serializers.Ability_Boost_FlawSerializer
class LanguageViewSet(viewsets.ModelViewSet):
    lookup_field = 'name'
    queryset = models.Language.objects.all()
    serializer_class = serializers.LanguageSerializer
class TraitViewSet(viewsets.ModelViewSet):
    lookup_field = 'name'
    queryset = models.Trait.objects.all()
    serializer_class = serializers.TraitSerializer
    @decorators.action(methods=['get'], detail=False, url_path='getnames', url_name='getnames')
    def getAncestryIds(self, request):
        queryset = self.queryset
        serializer = serializers.TraitNameSerializer(queryset, many=True)
        return response.Response(serializer.data)
class SpecialAbilityViewSet(viewsets.ModelViewSet):
    queryset = models.SpecialAbility.objects.all()
    serializer_class = serializers.SpecialAbilitySerializer
    
class HeritageViewSet(viewsets.ModelViewSet):
    lookup_field = 'name'
    queryset = models.Heritage.objects.all()
    serializer_class = serializers.HeritageSerializer
class AncestryViewSet(viewsets.ModelViewSet):
    queryset = models.Ancestry.objects.all()
    serializer_class = serializers.AncestrySerializer
    @decorators.action(methods=['get'], detail=False, url_path='getIds', url_name='getIds')
    def getAncestryIds(self, request):
        queryset = self.queryset
        serializer = serializers.AncestryIdsSerializer(queryset, many=True)
        return response.Response(serializer.data)
    @decorators.action(methods=['get'], detail=True, url_path='getFeats', url_name='getFeats')
    def getFeats(self, request, pk=None):
        instance = self.get_object()
        qs = Fodels.Feat.objects.filter(id__in=instance.feats.all())
        serializer = Ferial.FeatIdsSerializer(qs, many=True)
        return response.Response(serializer.data)
    
