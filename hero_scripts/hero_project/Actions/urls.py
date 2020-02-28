from django.urls import path, include
from Actions import views
from rest_framework import routers

router = routers.DefaultRouter()
router.register(r'list', views.ActionViewSet, base_name='ListAll')



app_name='Actions' #Needed to run tests

#This is your endpoint API
urlpatterns = [
    path('', include(router.urls)),
]