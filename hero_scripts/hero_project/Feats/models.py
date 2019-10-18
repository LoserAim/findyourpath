from django.db import models

TYPE_CHOICES = [
    ('ANC', 'Ancestry'),
    ('GEN', 'General'),
    ('SKI', 'Skill'),
    ('CLA', 'Class'),
]


CLASS_CHOICES = [
    ('ALCH', 'Alchemist'),
    ('BARB', 'Barbarian'),
    ('BARD', 'Bard'),
    ('CHAM', 'Champion'),
    ('CLER', 'Cleric'),
    ('DRUI', 'Druid'),
    ('FIGH', 'Fighter'),
    ('MONK', 'Monk'),
    ('RANG', 'Ranger'),
    ('ROGU', 'Rogue'),
    ('SORC', 'Sorcerer'),
    ('WIZA', 'Wizard'),
]

# Create your models here.
class Feat(models.Model):
    title       = models.TextField(unique=True, blank=False)
    description = models.TextField()
    level       = models.PositiveIntegerField(blank=False)
    pgnum       = models.PositiveIntegerField(blank=True, null=True)
    book        = models.TextField(blank=True, null=True)
    feat_type   = models.CharField(max_length=3, choices=TYPE_CHOICES, blank=True, null=True)
    class_name  = models.CharField(max_length=4, choices=CLASS_CHOICES, blank=True, null=True)
    



