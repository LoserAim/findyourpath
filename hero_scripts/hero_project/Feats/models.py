from django.db import models




# Create your models here.
class Feat(models.Model):
    title = models.TextField(unique=True, blank=False)
    description = models.TextField()
    level = models.PositiveIntegerField(blank=False)







class ReqSkill(models.Model):
    level = models.PositiveIntegerField(blank=False)
    skill_name = models.CharField(max_length=50)
    feat = models.ForeignKey(Feat, related_name='skills', on_delete=models.SET_NULL, null=True)