from django.db import models
from PathClasses import models as PCmodels
from Ancestries import models as Amodels
from Feats import models as Fmodels






# Create your models here.
class Character(models.Model):
    ALIGNMENT_CHOICES = [
        ('LG', 'Lawful Good'),
        ('NG', 'Neutral Good'),
        ('CG', 'Chaotic Good'),
        ('LN', 'Lawful Neutral'),
        ('TN', 'True Neutral'),
        ('CN', 'Chaotic Neutral'),
        ('LE', 'Lawful Evil'),
        ('NE', 'Neutral Evil'),
        ('CE', 'Chaotic Evil'),
    ]
    alignment = models.CharField(max_length=2, choices=ALIGNMENT_CHOICES, blank=True, null=True)
    level = models.IntegerField(null=True, blank=True)
    strength = models.IntegerField(null=True, blank=True)
    dexterity = models.IntegerField(null=True, blank=True)
    constitution = models.IntegerField(null=True, blank=True)
    intelligence = models.IntegerField(null=True, blank=True)
    wisdom = models.IntegerField(null=True, blank=True)
    charisma = models.IntegerField(null=True, blank=True)
    name = models.CharField(max_length=256, blank=False)
    deity = models.CharField(max_length=256, blank=True)
    playerName = models.CharField(max_length=256, blank=True)
    path_class = models.ManyToManyField(PCmodels.PathClass, related_name="character_classes", blank=True)
    ancestry = models.ForeignKey(Amodels.Ancestry, related_name="character_ancestry", on_delete=models.CASCADE, null=True)
    heritage = models.ForeignKey(Amodels.Heritage, related_name="character_heritage", on_delete=models.CASCADE, null=True)
    archetype = models.ForeignKey(PCmodels.PathClassArchetype, related_name="character_class_archetype", on_delete=models.CASCADE, null=True)
    classFeats = models.ManyToManyField(Fmodels.Feat, related_name="character_class_feats", blank=True)
    proficiencies = models.ManyToManyField(PCmodels.Proficiency, related_name="character_proficienies", blank=True)
    ancestryFeats = models.ManyToManyField(Fmodels.Feat, related_name="character_ancestry_feats", blank=True)
    skillFeats = models.ManyToManyField(Fmodels.Feat, related_name="character_skill_feats", blank=True)
    generalFeats = models.ManyToManyField(Fmodels.Feat, related_name="character_general_feats", blank=True)
    hit_points = models.IntegerField(null=True, blank=True)
    experience = models.IntegerField(null=True, blank=True)

