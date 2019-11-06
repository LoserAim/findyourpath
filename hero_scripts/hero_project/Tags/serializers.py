from rest_framework import serializers
from Tags import models as todels

class TagSerializer(serializers.ModelSerializer):
    class Meta:
        model = todels.Tag
        fields = '__all__'
        