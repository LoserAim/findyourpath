import os
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'hero_project.settings')

import django
django.setup()

from Ancestries import models


def CreateLanguages():
    models.Language.objects.bulk_create([
        models.Language(name='Kelish'), 
        models.Language(name='Mwangi'), 
        models.Language(name='Osiriani'),
        models.Language(name='Shoanti'),
        models.Language(name='Skald'),
        models.Language(name='Tien'),
        models.Language(name='Varisian'),
        models.Language(name='Vudrani'),
        models.Language(name='Common'),
        models.Language(name='Dwarfen'),
        models.Language(name='Elven'),
        models.Language(name='Gnomish'),
        models.Language(name='Sylvan'),
        models.Language(name='Goblin'),
        models.Language(name='Halfing'),
        ])

def CreateAbilityBoostFlaws():
    models.Ability_Boost_Flaw.objects.bulk_create([
        models.Ability_Boost_Flaw(name='Strength'),
        models.Ability_Boost_Flaw(name='Dexterity'),
        models.Ability_Boost_Flaw(name='Constitution'),
        models.Ability_Boost_Flaw(name='Intelligence'),
        models.Ability_Boost_Flaw(name='Wisdom'),
        models.Ability_Boost_Flaw(name='Charisma'),
        models.Ability_Boost_Flaw(name='Free'),
        models.Ability_Boost_Flaw(name='Free_2'),
    ])


if __name__ == "__main__":
    CreateLanguages()