from django.urls import path, include
from .views import (
    ModifierViewSet,
    
)
from rest_framework import routers

router = routers.DefaultRouter()
router.register(r'list', ModifierViewSet, base_name='Modifier')



app_name='Modifiers' #Needed to run tests

#This is your endpoint API
urlpatterns = [
    path('', include(router.urls)),
]