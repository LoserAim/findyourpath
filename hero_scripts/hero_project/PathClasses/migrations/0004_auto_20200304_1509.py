# Generated by Django 2.2.7 on 2020-03-04 23:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('PathClasses', '0003_auto_20200226_1305'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pathclassfeature',
            name='name',
            field=models.CharField(max_length=256),
        ),
    ]