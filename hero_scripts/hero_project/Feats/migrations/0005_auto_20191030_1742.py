# Generated by Django 2.2.5 on 2019-10-31 00:42

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Feats', '0004_auto_20191018_1423'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='feat',
            name='class_name',
        ),
        migrations.RemoveField(
            model_name='feat',
            name='feat_type',
        ),
    ]
