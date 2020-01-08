from rest_framework import serializers
from Ancestries import models
from Feats.models import Feat
from Feats.serializers import FeatSerializer

class Ability_Boost_FlawSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Ability_Boost_Flaw
        fields = '__all__'
class LanguageSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Language
        fields = '__all__'
class TraitSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Trait
        fields = '__all__'
class SpecialAbilitySerializer(serializers.ModelSerializer):
    class Meta:
        model = models.SpecialAbility
        fields = '__all__'
class HeritageSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Heritage
        fields = '__all__'

class AncestryIdsSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Ancestry
        fields = ['id']
class AncestrySerializer(serializers.ModelSerializer):
    #serializers.PrimaryKeyRelatedField(required=False, queryset=models.Tag.objects.all(), many=True)
    ability_boosts      = serializers.SlugRelatedField(slug_field='name', read_only=False, queryset=models.Ability_Boost_Flaw.objects.all(), many=True)
    ability_flaws       = serializers.SlugRelatedField(slug_field='name', read_only=False, queryset=models.Ability_Boost_Flaw.objects.all(), many=True)
    languages           = serializers.SlugRelatedField(slug_field='name', read_only=False, queryset=models.Language.objects.all(), many=True)
    traits              = serializers.SlugRelatedField(slug_field='name', read_only=False, queryset=models.Trait.objects.all(), many=True)
    special_abilities   = serializers.SlugRelatedField(slug_field='name', read_only=False, queryset=models.SpecialAbility.objects.all(), many=True)
    class Meta:
        model = models.Ancestry
        fields = [
            'id',
            'hit_points',
            'size',
            'speed',
            'name',
            'book',
            'pgnum',
            'ability_boosts',
            'ability_flaws',
            'languages',
            'traits',
            'special_abilities',
            'heritages',
            'feats'
        ]
    def to_representation(self, instance):
        data = super().to_representation(instance)
        if data['feats'] != None:
            data['feats'] = FeatSerializer(
                Feat.objects.filter(pk__in=data['feats']),
                many=True).data
        if data['heritages'] != None:
            data['heritages'] = HeritageSerializer(
                models.Heritage.objects.filter(pk__in=data['heritages']),
                many=True).data
        return data



