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
    archetypes       = serializers.SlugRelatedField(many=True, slug_field='id', queryset=models.PathClassArchetype.objects.all())
    features           = serializers.SlugRelatedField(many=True, slug_field='id', queryset=models.PathClassFeature.objects.all())
    class Meta:
        model = models.PathClass
        fields = [
            'id',
            'name',
            'key_ability',
            'additional_skills',
            'hit_points',
            'proficiencies',
            'archetypes',
            'features',
            'class_feats',
            'pgnum',
            'book',
        ]