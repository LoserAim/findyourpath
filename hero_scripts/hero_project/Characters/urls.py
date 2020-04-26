from django.urls import path, include
from Characters import views
from rest_framework import routers

router = routers.DefaultRouter()
router.register(r'list', views.CharacterViewSet, base_name='Character')




app_name='Characters' #Needed to run tests

#This is your endpoint API
urlpatterns = [
    path('', include(router.urls)),
]