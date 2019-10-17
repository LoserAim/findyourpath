# Generated by Django 2.2.5 on 2019-10-17 04:40

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Requirements', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='requirement',
            name='ability_score',
            field=models.PositiveIntegerField(blank=True, default=0, null=True),
        ),
        migrations.AlterField(
            model_name='requirement',
            name='ability_name',
            field=models.CharField(blank=True, choices=[('STR', 'Strength'), ('DEX', 'Dexterity'), ('CON', 'Constitution'), ('INT', 'Intelligence'), ('WIS', 'Wisdom'), ('CHA', 'Charisma')], max_length=3, null=True),
        ),
        migrations.AlterField(
            model_name='requirement',
            name='feat',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='requirements', to='Feats.Feat'),
        ),
        migrations.AlterField(
            model_name='requirement',
            name='level',
            field=models.PositiveIntegerField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='requirement',
            name='proficiency',
            field=models.CharField(blank=True, choices=[('T', 'Trained'), ('E', 'Expert'), ('M', 'Master'), ('L', 'Legend')], max_length=1, null=True),
        ),
        migrations.AlterField(
            model_name='requirement',
            name='skill_name',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
    ]
