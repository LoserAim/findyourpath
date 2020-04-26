# Generated by Django 2.2.7 on 2020-03-09 05:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Characters', '0003_auto_20200308_2150'),
    ]

    operations = [
        migrations.AddField(
            model_name='character',
            name='charisma',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='character',
            name='constitution',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='character',
            name='dexterity',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='character',
            name='intelligence',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='character',
            name='strength',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='character',
            name='wisdom',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.DeleteModel(
            name='AbilityScores',
        ),
    ]
