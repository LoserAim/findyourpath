from django.urls import path, include
from .views import (
    FeatViewSet,

)
from rest_framework import routers

router = routers.DefaultRouter()
router.register(r'list', FeatViewSet, base_name='Feat')



app_name='Feats' #Needed to run tests

#This is your endpoint API
urlpatterns = [
    path('', include(router.urls)),
]