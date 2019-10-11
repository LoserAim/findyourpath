from django.urls import path, include
from .views import (
    FeatViewSet,
    ReqSkillViewSet,
)
from rest_framework import routers

router = routers.DefaultRouter()
router.register(r'list', FeatViewSet, base_name='Feat')
router.register(r'req/list', ReqSkillViewSet, base_name='req_list')


app_name='Feats' #Needed to run tests

#This is your endpoint API
urlpatterns = [
    path('', include(router.urls)),
]