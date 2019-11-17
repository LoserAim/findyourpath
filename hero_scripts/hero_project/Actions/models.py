from django.db import models
from Feats.models import Feat
from Ancestries.models import Heritage
# Create your models here.
class Action(models.Model):
    TYPE_CHOICES = [
    ('A', 'Action'),
    ('F', 'Free'),
    ('R', 'Reaction'),
    ]
    action_type = models.CharField(max_length=1,choices=TYPE_CHOICES, blank=False, null=False)
    name = models.CharField(max_length=256)
    description = models.TextField()
    trigger = models.TextField(null=True)
    cost = models.IntegerField(blank=False, null=False)
    feat = models.ForeignKey(Feat, related_name='Actions', on_delete=models.CASCADE)
    heritage = models.ForeignKey(Heritage, related_name='Actions', on_delete=models.CASCADE)
    def __str__(self):
        return '%d: %s.%s' % (self.id, self.action_type, self.name)