from django.urls import path, include
from Ancestries import views
from rest_framework import routers

router = routers.DefaultRouter()
router.register(r'list', views.AncestryViewSet, base_name='ListAll')
router.register(r'abilities', views.Ability_Boost_FlawViewSet, base_name='Abilities')
router.register(r'languages', views.LanguageViewSet, base_name='Languages')
router.register(r'traits', views.TraitViewSet, base_name='Traits')
router.register(r'specialabilities', views.SpecialAbilityViewSet, base_name='SpecialAbilities')
router.register(r'heritages', views.HeritageViewSet, base_name='Heritages')


app_name='Ancestries' #Needed to run tests

#This is your endpoint API
urlpatterns = [
    path('', include(router.urls)),
]