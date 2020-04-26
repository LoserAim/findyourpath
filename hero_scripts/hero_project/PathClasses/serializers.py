from rest_framework import serializers
from PathClasses import models
from Feats import models as fodels
from feats import serializers as ferializers


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
    def to_representation(self, instance):
        data = super().to_representation(instance)
        if data['features'] != None:
            data['features'] = PathClassFeatureSerializer(
                models.PathClassFeature.objects.filter(pk__in=data['features']),
                many=True).data
        if data['proficiencies'] != None:
            data['proficiencies'] = ProficiencySerializer(
                models.Proficiency.objects.filter(pk__in=data['proficiencies']),
                many=True).data
        if data['archetypes'] != None:
            data['archetypes'] = PathClassArchetypeSerializer(
                models.PathClassArchetype.objects.filter(pk__in=data['archetypes']),
                many=True).data
        if data['class_feats'] != None:
            data['class_feats'] = ferializers.FeatSerializer(
                fodels.Feat.objects.filter(pk__in=data['class_feats']),
                many=True).data
        return data