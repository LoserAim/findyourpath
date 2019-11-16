from django.db import models
from Feats.models import Feat
# Create your models here.
class Ability_Boost_Flaw(models.Model):
    name = models.CharField(max_length=12,unique=True)
    def __str__(self):
        return '%d: %s' % (self.id, self.name)
class Language(models.Model):
    name = models.CharField(max_length=50,unique=True)
    def __str__(self):
        return '%d: %s' % (self.id, self.name)
class Trait(models.Model):
    name = models.CharField(max_length=100,unique=True)
    def __str__(self):
        return '%d: %s' % (self.id, self.name)
class SpecialAbility(models.Model):
    name        = models.CharField(max_length=100,unique=True)
    description = models.TextField(blank=False)
    def __str__(self):
        return '%d: %s' % (self.id, self.name)
    #TODO: Edit modifiers for different types Special Abilities may have these
    #i.e. Ability, Skills, Strikes, etc
class Heritage(models.Model):
    name        = models.CharField(max_length=256,unique=True)
    description = models.TextField(blank=False)
    def __str__(self):
        return '%d: %s' % (self.id, self.name)
    # Certain conditional abilities. May have special abilities be expanded
    # to compensate for this.


class Ancestry(models.Model):
    SIZE_CHOICES = [
    ('T', 'Tiny'),
    ('S', 'Small'),
    ('M', 'Medium'),
    ('L', 'Large'),
    ('H', 'Huge'),
    ('G', 'Gargantuan'),
    ]
    name                = models.CharField(max_length=256, blank=False)
    hit_points          = models.IntegerField(null=True, blank=True)
    size                = models.CharField(max_length=1,choices=SIZE_CHOICES, blank=False, null=True)
    speed               = models.PositiveIntegerField(null=True, blank=True)
    ability_boosts      = models.ManyToManyField(Ability_Boost_Flaw,    related_name='Ancestries_Ability_Boosts', blank=True)
    ability_flaws       = models.ManyToManyField(Ability_Boost_Flaw,    related_name='Ancestries_Ability_Flaws', blank=True)
    languages           = models.ManyToManyField(Language,              related_name='Ancestries', blank=True)
    traits              = models.ManyToManyField(Trait,                 related_name='Ancestries', blank=True)
    special_abilities   = models.ManyToManyField(SpecialAbility,        related_name='Ancestries', blank=True)
    heritages           = models.ManyToManyField(Heritage,              related_name='Ancestries', blank=True)
    feats               = models.ManyToManyField(Feat,                  related_name='Ancestries', blank=True)
    book                = models.CharField(max_length=256,blank=True, null=True)
    pgnum               = models.PositiveIntegerField(blank=True, null=True)