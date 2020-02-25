from django.urls import path, include
from PathClasses import views
from rest_framework import routers

router = routers.DefaultRouter()
router.register(r'list', views.PathClassViewSet, base_name='PathClass')
router.register(r'proficiencies', views.ProficiencyViewSet, base_name='Proficiency')
router.register(r'features', views.PathClassFeatureViewSet, base_name='Feature')
router.register(r'archetypes', views.PathClassArchetypeViewSet, base_name='Archetype')




app_name='PathClasses' #Needed to run tests

#This is your endpoint API
urlpatterns = [
    path('', include(router.urls)),
]