
from rest_framework import serializers
from Feats.models import Feat
from Feats.serializers import FeatSerializer

from .models import Requirement


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

