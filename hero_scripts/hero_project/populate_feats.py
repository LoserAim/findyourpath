import os
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'hero_project.settings')

import django
django.setup()

import random
from Feats.models import (
    Feat, 
    Modifier, 
    ReqSkill
    )