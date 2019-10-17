from django.db import models
from Feats.models import Feat

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

    feat = models.ForeignKey(Feat, related_name='modifiers', on_delete=models.CASCADE)
    mod_type = models.CharField(max_length=3, choices=MODIFIER_CHOICES, blank=False)
    mod_value = models.IntegerField(blank=False)