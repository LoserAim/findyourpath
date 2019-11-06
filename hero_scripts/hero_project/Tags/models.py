from django.db import models
from Feats import models as fodels
# Create your models here.
class Tag(models.Model):
    name = models.CharField(max_length=50, primary_key=True, blank=False, null=False)
    feats = models.ManyToManyField(fodels.Feat, related_name='tags', blank=True)