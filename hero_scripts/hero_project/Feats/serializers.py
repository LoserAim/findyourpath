from rest_framework import serializers
from Feats.models import (
    Feat, 
    ReqSkill,
) 

from Modifiers.models import Modifier




class FeatSerializer(serializers.Serializer):

    modifiers = serializers.SerializerMethodField()
    skills = serializers.SerializerMethodField()

    def get_modifiers(self, data):
        return {
            'id':data.id
        }
    def get_skills(self, data):
        return {
            'id':data.id
        }

    class Meta:
        model = Feat
        fields = [
            'id',
            'title',
            'description',
            'level',
            'modifiers',
            'skills',
        ]


class ReqSkillSerializer(serializers.Serializer):
    class Meta:
        model = ReqSkill
        fields = [
            'id',
            'level',
            'skill_name',
            'feat',
        ]
    def to_representation(self, instance):
        data = super().to_representation(instance)
        data['feat'] = FeatSerializer(
            Feat.objects.get(pk=data['feat'])).data
        return data