from rest_framework import serializers
from .models import Modifier
from Feats.models import Feat
from Feats.serializers import FeatSerializer

class ModifierSerializer(serializers.ModelSerializer):

    class Meta:
        model = Modifier
        fields = [
            'id',
            'mod_type',
            'mod_value',
            'feat',
        ]
    def to_representation(self, instance):
        data = super().to_representation(instance)
        data['feat'] = FeatSerializer(
            Feat.objects.get(pk=data['feat'])).data
        return data