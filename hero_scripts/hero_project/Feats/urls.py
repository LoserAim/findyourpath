from django.urls import path, include
from .views import (
    FeatsViewSet,
    TagsViewSet,
    RequirementsViewSet

)
from rest_framework import routers

router = routers.DefaultRouter()
router.register(r'list', FeatsViewSet, base_name='Feat')
router.register(r'tags', TagsViewSet, base_name='Tag')
router.register(r'requirements', RequirementsViewSet, base_name='Requirement')


app_name='Feats' #Needed to run tests

#This is your endpoint API
urlpatterns = [
    path('', include(router.urls)),
]