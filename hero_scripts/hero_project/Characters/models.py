from django.db import models
from PathClasses import models as PCmodels
from Ancestries import models as Amodels
from Feats import models as Fmodels






# Create your models here.
class Character(models.Model):
    name = models.CharField(max_length=256, blank=False)
    playerName = models.CharField(max_length=256, blank=False)
    path_class = models.ManyToManyField(PCmodels.PathClass, related_name="character_classes", blank=False)
    ancestry = models.ForeignKey(Amodels.Ancestry, related_name="character_ancestry", on_delete=models.CASCADE, null=True)
    heritage = models.ForeignKey(Amodels.Heritage, related_name="character_heritage", on_delete=models.CASCADE, null=True)
    archetype = models.ForeignKey(PCmodels.PathClassArchetype, related_name="character_class_archetype", on_delete=models.CASCADE, null=True)
    classFeats = models.ManyToManyField(Fmodels.Feat, related_name="character_class_feats", blank=True)
    ancestryFeats = models.ManyToManyField(Fmodels.Feat, related_name="character_ancestry_feats", blank=True)
    skillFeats = models.ManyToManyField(Fmodels.Feat, related_name="character_skill_feats", blank=True)
    generalFeats = models.ManyToManyField(Fmodels.Feat, related_name="character_general_feats", blank=True)
    hit_poits = models.IntegerField(null=True, blank=True)
    experience = models.IntegerField(null=True, blank=True)

class AbilityScores(models.Model):
    strength = models.IntegerField()
    dexterity = models.IntegerField()
    constitution = models.IntegerField()
    intelligence = models.IntegerField()
    wisdom = models.IntegerField()
    charisma = models.IntegerField()
    character = models.ForeignKey(Character, related_name="character_abilities", on_delete=models.CASCADE, null=True)