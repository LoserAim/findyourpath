from rest_framework import serializers
from Feats.models import (
    Feat, 
    Tag,
    Requirement
) 



class TagSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tag
        fields = '__all__'



class FeatSerializer(serializers.ModelSerializer):
    tags = serializers.SlugRelatedField(read_only=False, slug_field='name', many=True, queryset=Tag.objects.all())
    class Meta:
        model = Feat
        fields = [
            'id',
            'name',
            'description',
            'level',
            'pgnum',
            'book',
            'tags',
        ]


class RequirementSerializer(serializers.ModelSerializer):
    
    
    class Meta:
        model = Requirement
        fields = [
            'id',
            'level',
            'skill_name',
            'proficiency',
            'ability_name',
            'ability_score',
            'feat',
        ]
    def to_representation(self, instance):
        data = super().to_representation(instance)
        data['feat'] = FeatSerializer(
            Feat.objects.get(pk=data['feat'])).data
        return data


