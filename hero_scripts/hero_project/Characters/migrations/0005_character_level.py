# Generated by Django 2.2.7 on 2020-03-09 07:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Characters', '0004_auto_20200308_2250'),
    ]

    operations = [
        migrations.AddField(
            model_name='character',
            name='level',
            field=models.IntegerField(blank=True, null=True),
        ),
    ]
