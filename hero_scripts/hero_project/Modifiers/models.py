from django.db import models
from Feats.models import Feat
from PathClasses.models import PathClassFeature

MODIFIER_CHOICES = [
    ('STR', 'Strength'),
    ('DEX', 'Dexterity'),
    ('CON', 'Constitution'),
    ('INT', 'Intelligence'),
    ('WIS', 'Wisdom'),
    ('CHA', 'Charisma'),
    ('ATR', 'Attack Roll'),
    ('ATD', 'Attack Damage'),
    ('SPR', 'Spell Roll'),
    ('SDC', 'Spell DC'),
]
# Create your models here.
class Modifier(models.Model):
    path_class = models.ForeignKey(PathClassFeature, related_name='class_features', on_delete=models.CASCADE)
    feat = models.ForeignKey(Feat, related_name='modifiers', on_delete=models.CASCADE)
    mod_type = models.CharField(max_length=3, choices=MODIFIER_CHOICES, blank=False)
    mod_value = models.IntegerField(blank=False)