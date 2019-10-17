from django.db import models




# Create your models here.
class Feat(models.Model):
    title = models.TextField(unique=True, blank=False)
    description = models.TextField()
    level = models.PositiveIntegerField(blank=False)
    



