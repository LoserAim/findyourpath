from django.shortcuts import render
from rest_framework import (
    mixins, 
    generics, 
    viewsets,
    decorators,
    response,
)
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
    # @decorators.action(methods=['get'], detail=False, url_path='EntireAncestry', url_name='EntireAncestry')
    # def getEntireAncestry(self, request):
