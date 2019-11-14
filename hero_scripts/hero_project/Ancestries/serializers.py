from rest_framework import serializers
from Ancestries import models


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
class AncestrySerializer(serializers.ModelSerializer):
    #serializers.PrimaryKeyRelatedField(required=False, queryset=models.Tag.objects.all(), many=True)
    ability_boosts      = serializers.PrimaryKeyRelatedField(required=False, queryset=models.Ability_Boost_Flaw.objects.all(), many=True)
    ability_flaws       = serializers.PrimaryKeyRelatedField(required=False, queryset=models.Ability_Boost_Flaw.objects.all(), many=True)
    languages           = serializers.PrimaryKeyRelatedField(required=False, queryset=models.Language.objects.all(), many=True)
    traits              = serializers.PrimaryKeyRelatedField(required=False, queryset=models.Trait.objects.all(), many=True)
    special_abilities   = serializers.PrimaryKeyRelatedField(required=False, queryset=models.SpecialAbility.objects.all(), many=True)
    heritages           = serializers.PrimaryKeyRelatedField(required=False, queryset=models.Heritage.objects.all(), many=True)
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
            'book',
            'pgnum',
        ]


