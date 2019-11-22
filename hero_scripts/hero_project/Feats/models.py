from django.db import models


class Tag(models.Model):
    name = models.CharField(max_length=50, unique=True, blank=False, null=False)
    def __str__(self):
        return '%d: %s' % (self.id, self.name)
    
# Create your models here.
class Feat(models.Model):
    name        = models.CharField(max_length=256, unique=True, blank=False)
    description = models.TextField()
    level       = models.PositiveIntegerField(blank=False)
    pgnum       = models.PositiveIntegerField(blank=True, null=True)
    book        = models.TextField(blank=True, null=True)
    tags        = models.ManyToManyField(Tag, related_name='feats', blank=True)
    def __str__(self):
        return '%d: %s %d' % (self.id, self.name, self.level)


class Requirement(models.Model):
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
    level = models.PositiveIntegerField(blank=True, null=True)
    skill_name = models.CharField(max_length=50, blank=True, null=True)
    proficiency = models.CharField(max_length=1, choices=PROFICIENCY_CHOICES, blank=True, null=True)
    ability_name = models.CharField(max_length=3, choices=ABILITY_CHOICES, blank=True, null=True)
    ability_score = models.PositiveIntegerField(blank=True, null=True, default=0)
    feat = models.ForeignKey(Feat, related_name='requirements', on_delete=models.CASCADE)
