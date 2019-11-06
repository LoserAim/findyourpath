from rest_framework import serializers
from Feats.models import (
    Feat, 
) 
from Tags import models






class FeatSerializer(serializers.ModelSerializer):
    tags = serializers.PrimaryKeyRelatedField(required=False, queryset=models.Tag.objects.all(), many=True)
    class Meta:
        model = Feat
        fields = [
            'id',
            'title',
            'description',
            'level',
            'pgnum',
            'book',
            'tags',
        ]

