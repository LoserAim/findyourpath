from rest_framework import serializers

from PathClasses import models as PCmodels
from PathClasses import serializers as PCserializers
from Ancestries import models as Amodels
from Ancestries import serializers as Aserializers
from Feats import serializers as Fserializers
from Feats import models as Fmodels

from Characters import models as Cmodels


class CharacterSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cmodels.Character
        fields = [
            'id',
            'level',
            'alignment',
            'deity',
            'strength',
            'dexterity',
            'constitution',
            'intelligence',
            'wisdom',
            'charisma',
            'name',
            'playerName',
            'path_class',
            'ancestry',
            'heritage',
            'archetype',
            'classFeats',
            'ancestryFeats',
            'skillFeats',
            'generalFeats',
            'hit_points',
            'experience'
        ]

class CharacterFullSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cmodels.Character
        fields = [
            'id',
            'level',
            'alignment',
            'deity',
            'strength',
            'dexterity',
            'constitution',
            'intelligence',
            'wisdom',
            'charisma',
            'name',
            'proficiencies',
            'playerName',
            'path_class',
            'ancestry',
            'heritage',
            'archetype',
            'classFeats',
            'ancestryFeats',
            'skillFeats',
            'generalFeats',
            'hit_points',
            'experience'
        ]
    def to_representation(self, instance):
        data = super().to_representation(instance)
        if data['classFeats'] != None:
            data['classFeats'] = Fserializers.FeatSerializer(
                Fmodels.Feat.objects.filter(pk__in=data['classFeats']),
                many=True).data
        if data['proficiencies'] != None:
            data['proficiencies'] = PCserializers.ProficiencySerializer(
                PCmodels.Proficiency.objects.filter(pk__in=data['proficiencies']),
                many=True).data
        if data['ancestryFeats'] != None:
            data['ancestryFeats'] = Fserializers.FeatSerializer(
                Fmodels.Feat.objects.filter(pk__in=data['ancestryFeats']),
                many=True).data
        if data['skillFeats'] != None:
            data['skillFeats'] = Fserializers.FeatSerializer(
                Fmodels.Feat.objects.filter(pk__in=data['skillFeats']),
                many=True).data
        if data['generalFeats'] != None:
            data['generalFeats'] = Fserializers.FeatSerializer(
                Fmodels.Feat.objects.filter(pk__in=data['generalFeats']),
                many=True).data
        if data['heritage'] != None:
            data['heritage'] = Aserializers.HeritageSerializer(
                Amodels.Heritage.objects.get(id=data['heritage']),
                many=False).data
        if data['path_class'] != None:
            data['path_class'] = PCserializers.PathClassSerializer(
                PCmodels.PathClass.objects.filter(pk__in=data['path_class']),
                many=True).data
        if data['archetype'] != None:
            data['archetype'] = PCserializers.PathClassArchetypeSerializer(
                PCmodels.PathClassArchetype.objects.get(id=data['archetype']),
                many=False).data
        if data['ancestry'] != None:
            data['ancestry'] = Aserializers.AncestrySerializer(
                Amodels.Ancestry.objects.get(id=data['ancestry']),
                many=False).data
        return data

class CharacterIdsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cmodels.Character
        fields = ['id']