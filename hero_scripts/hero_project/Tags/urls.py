from django.urls import path, include
from Tags import views
from rest_framework import routers

router = routers.DefaultRouter()
router.register(r'list', views.TagsViewSet, base_name='Tag')



app_name='Tags' #Needed to run tests

#This is your endpoint API
urlpatterns = [
    path('', include(router.urls)),
]