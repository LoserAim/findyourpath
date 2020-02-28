from rest_framework import serializers
from PathClasses import models


class ProficiencySerializer(serializers.ModelSerializer):
    class Meta:
            model = models.Proficiency
            fields = '__all__'
class PathClassArchetypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.PathClassArchetype
        fields = '__all__'

class PathClassFeatureSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.PathClassFeature
        fields = '__all__'

class PathClassArchetypeIdsSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.PathClassArchetype
        fields = ['id']

class PathClassFeatureIdsSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.PathClassFeature
        fields = ['id']

class PathClassIdsSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.PathClassFeature
        fields = ['id']
class PathClassSerializer(serializers.ModelSerializer):
    archetypes       = PathClassArchetypeIdsSerializer(many=True, required=False)
    features           = PathClassFeatureIdsSerializer(many=True, required=False)
    class Meta:
        model = models.PathClass
        fields = [
            'id',
            'name',
            'key_ability',
            'proficiencies',
            'archetypes',
            'additional_skills',
            'features',
            'class_feats',
            'pgnum',
            'book',
        ]