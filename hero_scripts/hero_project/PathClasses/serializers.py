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
class PathClassIdsSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.PathClassFeature
        fields = ['id']
class PathClassSerializer(serializers.ModelSerializer):
    proficiencies      = ProficiencySerializer(many=True, required=False)
    archetypes       = PathClassArchetypeSerializer(many=True, required=False)
    features           = PathClassFeatureSerializer(many=True, required=False)
    class Meta:
        model = models.PathClassFeature
        fields = [
            'name',
            'hit_points',
            'key_ability',
            'proficiencies',
            'archetypes',
            'features',
            'general_feats',
            'skill_feats',
            'class_feats',
            'pgnum',
            'book',
        ]