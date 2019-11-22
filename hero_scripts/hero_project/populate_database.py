import os
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'hero_project.settings')

import django
django.setup()
from Feats import models as fodels
from Actions import models as Actodels
from Ancestries import models as AncModel


def CreateLanguages():
    data =[
        AncModel.Language(name='Kelish'), 
        AncModel.Language(name='Mwangi'), 
        AncModel.Language(name='Osiriani'),
        AncModel.Language(name='Shoanti'),
        AncModel.Language(name='Skald'),
        AncModel.Language(name='Tien'),
        AncModel.Language(name='Varisian'),
        AncModel.Language(name='Vudrani'),
        AncModel.Language(name='Common'),
        AncModel.Language(name='Dwarven'),
        AncModel.Language(name='Elven'),
        AncModel.Language(name='Gnomish'),
        AncModel.Language(name='Sylvan'),
        AncModel.Language(name='Goblin'),
        AncModel.Language(name='Halfing'),
        ]
    AncModel.Language.objects.bulk_create(data)


def CreateAbilityBoostFlaws():
    data = [
        AncModel.Ability_Boost_Flaw(name='Strength'),
        AncModel.Ability_Boost_Flaw(name='Dexterity'),
        AncModel.Ability_Boost_Flaw(name='Constitution'),
        AncModel.Ability_Boost_Flaw(name='Intelligence'),
        AncModel.Ability_Boost_Flaw(name='Wisdom'),
        AncModel.Ability_Boost_Flaw(name='Charisma'),
        AncModel.Ability_Boost_Flaw(name='Free'),
        AncModel.Ability_Boost_Flaw(name='Free_2'),
    ]
    AncModel.Ability_Boost_Flaw.objects.bulk_create(data)


def CreateAncestryFeats():
    book = "Player's Core Rulebook"
    data = [
        fodels.Feat(
            name='Dwarven Lore',
            description="You eagerly absorbed the old stories and traditions of your ancestors, your gods, and your people, studying in subjects and techniques passed down for generation upon generation. You gain the trained proficiency rank in Crafting and Religion. If you would automatically become trained in one of those skills (from your background or class, for example), you instead become trained in a skill of your choice. You also become trained in Dwarven Lore.",
            level=1,
            pgnum=36,
            book=book,
            ),
        fodels.Feat(
            name='Dwarven Weapon Familiarity',
            description="Your kin have instilled in you an affinity for hard-hitting weapons, and you prefer these to more elegant arms. You are trained with the battle axe, pick, and warhammer. You also gain access to all uncommon dwarf weapons. For the purpose of determining your proficiency, martial dwarf weapons are simple weapons and advanced dwarf weapons are martial weapons.",
            level=1,
            pgnum=36,
            book=book,
            ),
        fodels.Feat(
            name='Rock Runner',
            description="Your innate connection to stone makes you adept at moving across uneven surfaces. You can ignore difficult terrain caused by rubble and uneven ground made of stone and earth. In addition, when you use the Acrobatics skill to Balance on narrow surfaces or uneven ground made of stone or earth, you aren't flat-footed, and when you roll a success at one of these Acrobatics checks, you get a critical success instead.",
            level=1,
            pgnum=36,
            book=book,
            ),
        fodels.Feat(
            name='Stone Cunning',
            description="You have a knack for noticing even small inconsistencies and craftsmanship techniques in the stonework around you. You gain a +2 circumstance bonus to Perception checks to notice unusual stonework. This bonus applies to checks to discover mechanical traps made of stone or hidden within stone. If you aren't using the Seek action or searching, the GM automatically rolls a secret check for you to notice unusual stonework anyway. This check doesn't gain the circumstance bonus, and it takes a –2 circumstance penalty.",
            level=1,
            pgnum=36,
            book=book,
            ),
        fodels.Feat(
            name='Unburdened Iron',
            description="You've learned techniques first devised by your ancestors during their ancient wars, allowing you to comfortably wear massive suits of armor. Ignore the reduction to your Speed from any armor you wear. In addition, any time you're taking a penalty to your Speed from some other reason (such as from the encumbered condition or from a spell), deduct 5 feet from the penalty. For example, the encumbered condition normally gives a –10-foot penalty to Speed, but it gives you only a –5-foot penalty. If your Speed is taking multiple penalties, pick only one penalty to reduce.",
            level=1,
            pgnum=36,
            book=book,
            ),
        fodels.Feat(
            name='Vengeful Hatred',
            description="You heart aches for vengeance against those who have wronged your people. Choose one of the following dwarven ancestral foes when you gain Vengeful Hatred: drow, duergar, giant, or orc. You gain a +1 circumstance bonus to damage with weapons and unarmed attacks against creatures with that trait. If your attack would deal more than one weapon die of damage (as is common at higher levels than 1st), the bonus is equal to the number of weapon dice or unarmed attack dice. In addition, if a creature critically succeeds at an attack against you and deals damage to you, you gain your bonus to damage against that creature for 1 minute regardless of whether it has the chosen trait. Special Your GM can add appropriate creature traits to the ancestral foes list if your character is from a community that commonly fights other types of enemies.",
            level=1,
            pgnum=36,
            book=book,
            ),
        # Boulder Roll Requires Rock Runner and is an Action
        fodels.Feat(
            name='Boulder Roll',
            description="Your dwarven build allows you to push foes around, just like a mighty boulder tumbles through a subterranean cavern. Take a Step into the square of a foe that is your size or smaller, and the foe must move into the empty space directly behind it. The foe must move even if doing so places it in harm's way. The foe can attempt a Fortitude saving throw against your Athletics DC to block your Step. If the foe attempts this saving throw, unless it critically succeeds, it takes bludgeoning damage equal to your level plus your Strength modifier. If the foe can't move into an empty space (if it is surrounded by solid objects or other creatures, for example), your Boulder Roll has no effect.",
            level=5,
            pgnum=36,
            book=book,
            ),
        # Dwarven Weapon Cunning requires Dwarven Weapon Familiarity
        fodels.Feat(
            name='Dwarven Weapon Cunning',
            description="You've learned cunning techniques to get the best effects out of your dwarven weapons. Whenever you critically hit using a battle axe, pick, warhammer, or a dwarf weapon, you apply the weapon's critical specialization effect.",
            level=5,
            pgnum=37,
            book=book,
            ),
        fodels.Feat(
            name="Mountain's Stoutness",
            description="Your hardiness lets you withstand more punishment than most before going down. Increase your maximum Hit Points by your level. You also decrease the DC of recovery checks when you have the dying condition by 1. If you also have the Toughness feat, the Hit Points gained from it and this feat are cumulative, and you decrease the DC of recovery checks by 4.",
            level=9,
            pgnum=37,
            book=book,
            ),
        fodels.Feat(
            name='Stonewalker',
            description="You have a deep reverence for and connection to stone. You gain meld into stone as a 3rd‑level divine innate spell that you can cast once per day. If you have the Stonecunning dwarf ancestry feat, you can attempt to find unusual stonework and stonework traps that require legendary proficiency in Perception. If you have both Stonecunning and legendary proficiency in Perception, when you're not Seeking and the GM rolls a secret check for you to notice unusual stonework, you keep the bonus from Stonecunning and don't take the –2 circumstance penalty.",
            level=9,
            pgnum=37,
            book=book,
            ),
        # Dwarven Weapon Expertise requires Dwarven Weapon Familiarity    
        fodels.Feat(
            name='Dwarven Weapon Expertise',
            description="Your dwarven affinity blends with your training, granting you great skill with dwarven weapons. Whenever you gain a class feature that grants you expert or greater proficiency in certain weapons, you also gain that proficiency for battle axes, picks, warhammers, and all dwarven weapons in which you are trained.",
            level=13,
            pgnum=37,
            book=book,
            ),
    ]
    fodels.Feat.objects.bulk_create(data)


def CreateTags():
    data = [
        fodels.Tag(name='Ancestry'),
        fodels.Tag(name='Dwarf'),
        fodels.Tag(name='General'),
        fodels.Tag(name='Skill'),
        fodels.Tag(name='Fighter'),
        fodels.Tag(name='Alchemist'),
        fodels.Tag(name='Cleric'),
    ]
    fodels.Tag.objects.bulk_create(data)


def CreateAncestryDwarfRelations():
    list_feat_id = fodels.Feat.objects.all()
    list_tag_id = []
    list_tag_id.append(fodels.Tag.objects.filter(name__contains='Ancestry').first())
    list_tag_id.append(fodels.Tag.objects.filter(name__contains='Dwarf').first())
    relations = []
    for feat in list_feat_id:
        relations.append(fodels.Feat.tags.through(feat_id=feat.id,tag_id=list_tag_id[0].id))
        relations.append(fodels.Feat.tags.through(feat_id=feat.id,tag_id=list_tag_id[1].id))
    fodels.Feat.tags.through.objects.bulk_create(relations)


def CreateHeritages():
    data = [
        AncModel.Heritage(
            name='Ancient-Blooded Dwarf',
            description="Dwarven heroes of old could shrug off their enemies' magic, and some of that resistance manifests in you. You gain the Call on Ancient Blood reaction."
            ),
        AncModel.Heritage(
            name='Death Warden Dwarf',
            description="Your ancestors have been tomb guardians for generations, and the power they cultivated to ward off necromancy has passed on to you. If you roll a success on a saving throw against a necromancy effect, you get a critical success instead."
            ),
        AncModel.Heritage(
            name='Forge Dwarf',
            description="You have a remarkable adaptation to hot environments from ancestors who inhabited blazing deserts or volcanic chambers beneath the earth. This grants you fire resistance equal to half your level (minimum 1), and you treat environmental heat effects as if they were one step less extreme (incredible heat becomes extreme, extreme heat becomes severe, and so on)."
            ),
        AncModel.Heritage(
            name='Rock Dwarf',
            description="Your ancestors lived and worked among the great ancient stones of the mountains or the depths of the earth. This makes you solid as a rock when you plant your feet. You gain a +2 circumstance bonus to your Fortitude or Reflex DC against attempts to Shove or Trip you. This bonus also applies to saving throws against spells or effects that attempt to knock you prone. In addition, if any effect would force you to move 10 feet or more, you are moved only half the distance."
            ),
        AncModel.Heritage(
            name='Strong-Blooded Dwarf',
            description="Your blood runs hearty and strong, and you can shake off toxins. You gain poison resistance equal to half your level (minimum 1), and each of your successful saving throws against a poison affliction reduces its stage by 2, or by 1 for a virulent poison. Each critical success against an ongoing poison reduces its stage by 3, or by 2 for a virulent poison."
            ),
    ]
    heritages = AncModel.Heritage.objects.bulk_create(data)
    

def CreateSpecialAbilities():
    data = AncModel.SpecialAbility(
        name="Darkvision",
        description="You can see in darkness and dim light just as well as you can see in bright light, though your vision in darkness is in black and white.",
    )
    data.save()


def CreateTraits():
    data = [
        AncModel.Trait(
            name="Dwarf",
        ),
        AncModel.Trait(
            name="Humanoid",
        ),
        AncModel.Trait(
            name="Halfling",
        ),
        AncModel.Trait(
            name="Goblin",
        ),
        AncModel.Trait(
            name="Gnome",
        ),
        AncModel.Trait(
            name="Elf",
        ),
    ]
    AncModel.Trait.objects.bulk_create(data)


def CreateActions():
    action = Actodels.Action(
        action_type='Reaction',
        name='Call on Ancient Blood',
        trigger="You attempt a saving throw against a magical effect, but you haven't rolled yet.",
        description="Your ancestors' innate resistance to magic surges, before slowly ebbing down. You gain a +1 circumstance bonus to the triggering saving throw and until the end of this turn.",
        cost=1,
        heritage_id=1,
        )
    action.save()

if __name__ == "__main__":

