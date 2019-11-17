from rest_framework import serializers
from .models import Action
from Feats.models import Feat
from Feats.serializers import FeatSerializer
from Ancestries.models import Heritage
from Ancestries.serializers import HeritageSerializer

class ActionSerializer(serializers.ModelSerializer):

    class Meta:
        model = Action
        fields = [
            'action_type',
            'name',
            'description',
            'trigger',
            'cost',
            'feat',
            'heritage',
        ]
    def to_representation(self, instance):
        data = super().to_representation(instance)
        data['feat'] = FeatSerializer(
            Feat.objects.get(pk=data['feat'])).data
        data['heritage'] = HeritageSerializer(
            Heritage.objects.get(pk=data['heritage'])).data
        return data