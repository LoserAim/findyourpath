from rest_framework import serializers
from Feats.models import (
    Feat, 
) 






class FeatSerializer(serializers.ModelSerializer):

    class Meta:
        model = Feat
        fields = '__all__'

