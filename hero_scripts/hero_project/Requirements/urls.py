from django.urls import path, include
from .views import (
    RequirementViewSet,
)
from rest_framework import routers

router = routers.DefaultRouter()
router.register(r'list', RequirementViewSet, base_name='Requirement')



app_name='Requirements' #Needed to run tests

#This is your endpoint API
urlpatterns = [
    path('', include(router.urls)),
]