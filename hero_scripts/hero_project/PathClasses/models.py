from django.db import models
from Feats.models import Feat

MODIFIER_CHOICES = [
    ('STR', 'Strength'),
    ('DEX', 'Dexterity'),
    ('CON', 'Constitution'),
    ('INT', 'Intelligence'),
    ('WIS', 'Wisdom'),
    ('CHA', 'Charisma'),
    ('N/A', 'NULL'),
]

PROFICIENCY_TYPE = [
    ('CDC', 'Class Dice Check'),
    ('ARC', 'Armor'),
    ('PER', 'Perception'),
    ('SAT', 'Saving Throws'),
    ('SKS', 'Strike'),
    ('SKI', 'Skill'),
    ('WEA', 'Weapon'),
    ('SDC', 'Spell Dice Check'),

]

PROFICIENCY_RANK = [
    ('T', 'Trained'),
    ('E', 'Expert'),
    ('M', 'Master'),
    ('L', 'Legendary'),
]


class Proficiency(models.Model):
    name                = models.CharField(max_length=256, blank=False)
    proficiency_type    = models.CharField(max_length=3, choices=PROFICIENCY_TYPE, blank=False)
    rank                = models.CharField(max_length=1, choices=PROFICIENCY_RANK, blank=False)
    key_ability         = models.CharField(max_length=3, choices=MODIFIER_CHOICES, blank=False)



# Create your models here.
class PathClass(models.Model):
    name                = models.CharField(max_length=256, blank=False)
    hit_points          = models.IntegerField(null=True, blank=True)
    key_ability         = models.CharField(max_length=3, choices=MODIFIER_CHOICES, blank=False)
    proficiencies       = models.ManyToManyField(Proficiency, related_name='class_proficiencies', blank=True)
    class_feats         = models.ManyToManyField(Feat, related_name="class_feats", blank=True)
    pgnum               = models.PositiveIntegerField(blank=True, null=True)
    book                = models.TextField(blank=True, null=True)


class PathClassArchetype(models.Model):
    name                = models.CharField(max_length=256, blank=False)
    description         = models.TextField()
    path_class          = models.ForeignKey(PathClass, related_name="PathClassArchetype.path_class+", on_delete=models.CASCADE, null=True)
    pgnum               = models.PositiveIntegerField(blank=True, null=True)
    book                = models.TextField(blank=True, null=True)

class PathClassFeature(models.Model):
    path_class          = models.ForeignKey(PathClass, related_name="PathClassFeature.path_class+", on_delete=models.CASCADE, null=True)
    name                = models.CharField(max_length=256, unique=True, blank=False)
    description         = models.TextField()
    level               = models.PositiveIntegerField(blank=False)
    pgnum               = models.PositiveIntegerField(blank=True, null=True)
    book                = models.TextField(blank=True, null=True)
    def __str__(self):
        return '%d: %s %d' % (self.id, self.name, self.level)

