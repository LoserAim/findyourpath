from rest_framework import serializers

from PathClasses import models as PCmodels
from PathClasses import serializers as PCserializers
from Ancestries import models as Amodels
from Ancestries import serializers as Aserializers
from Feats import models as Fmodels

from Characters import models as Cmodels

class AbilityScoresSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cmodels.AbilityScores
        fields = '__all__'

class CharacterSerializer(serializers.ModelSerializer):
    ability_scores       = AbilityScoresSerializer(many=True, required=False)
    archetype       = PCserializers.PathClassArchetypeIdsSerializer(many=True, required=False)
    ancestry           = Aserializers.AncestryIdsSerializer(many=True, required=False)
    heritage           = Aserializers.HeritageIdsSerializer(many=True, required=False)
    class Meta:
        model = Cmodels.Character
        fields = [
            'id',
            'name',
            'playerName',
            'ability_scores',
            'path_class',
            'ancestry',
            'heritage',
            'archetype',
            'classFeats',
            'ancestryFeats',
            'skillFeats',
            'generalFeats',
            'hit_poits',
            'experience'
        ]

class CharacterIdsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cmodels.Character
        fields = ['id']