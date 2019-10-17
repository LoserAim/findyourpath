from django.db import models
from Feats.models import Feat
PROFICIENCY_CHOICES = [
    ('T', 'Trained'),
    ('E', 'Expert'),
    ('M', 'Master'),
    ('L', 'Legend'),
]


ABILITY_CHOICES = [
    ('STR', 'Strength'),
    ('DEX', 'Dexterity'),
    ('CON', 'Constitution'),
    ('INT', 'Intelligence'),
    ('WIS', 'Wisdom'),
    ('CHA', 'Charisma'),
]
# Create your models here.
class Requirement(models.Model):
    level = models.PositiveIntegerField(blank=True, null=True)
    skill_name = models.CharField(max_length=50, blank=True, null=True)
    proficiency = models.CharField(max_length=1, choices=PROFICIENCY_CHOICES, blank=True, null=True)
    ability_name = models.CharField(max_length=3, choices=ABILITY_CHOICES, blank=True, null=True)
    ability_score = models.PositiveIntegerField(blank=True, null=True, default=0)
    feat = models.ForeignKey(Feat, related_name='requirements', on_delete=models.CASCADE)