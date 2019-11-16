from django.shortcuts import render
from rest_framework import (
    mixins, 
    generics, 
    viewsets,
    decorators,
    response,
)
from .models import Feat, Tag, Requirement
from .serializers import FeatSerializer, TagSerializer, RequirementSerializer
from django.views.decorators.csrf import csrf_exempt


class TagsViewSet(
    viewsets.ModelViewSet, 
    ):
    queryset = Tag.objects.all()
    serializer_class = TagSerializer


class RequirementsViewSet(
    viewsets.ModelViewSet):
    queryset = Requirement.objects.all()
    serializer_class = RequirementSerializer


class FeatsViewSet(
    viewsets.ModelViewSet):
    queryset = Feat.objects.all()
    serializer_class = FeatSerializer
    @decorators.action(methods=['get'], detail=False, url_path='filterbytag', url_name='filterbytag')
    def getFeatsByTag(self, request):
        queryset = self.queryset
        query_tag = request.query_params.get('tag', None)
        print("This is the query: " + query_tag)
        if query_tag is not None:
            queryset = queryset.filter(tags__name__icontains=query_tag)
        else:
            print("query_tag is empty")
        serializer = FeatSerializer(queryset, many=True)
        return response.Response(serializer.data)
    @decorators.action(methods=['get'], detail=False, url_path='searchgeneral', url_name='searchgeneral')
    def getGeneralFeats(self, request):
        queryset = self.queryset.filter(tags__name__icontains='general') | \
            self.queryset.filter(tags__name__icontains='skill')
        query_title = request.query_params.get('title', None)
        if query_title is not None:
            queryset = queryset.filter(title__icontains=query_title)
        serializer = FeatSerializer(queryset, many=True)
        return response.Response(serializer.data)






