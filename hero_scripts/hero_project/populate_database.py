import os
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'hero_project.settings')

import django
django.setup()
from Feats import models as fodels
from Actions import models as Actodels
from Ancestries import models as AncModel
from PathClasses import models as ClassModel


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

    list_tag_id = []
    list_tag_id.append(fodels.Tag.objects.filter(name__contains='Ancestry').first())
    list_tag_id.append(fodels.Tag.objects.filter(name__contains='Dwarf').first())
    list_tag_id.append(fodels.Tag.objects.filter(name__contains='General').first())
    list_tag_id.append(fodels.Tag.objects.filter(name__contains='Skill').first())
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
            tags=[list_tag_id[1].id, list_tag_id[0].id],
            ),
        fodels.Feat(
            name='Rock Runner',
            description="Your innate connection to stone makes you adept at moving across uneven surfaces. You can ignore difficult terrain caused by rubble and uneven ground made of stone and earth. In addition, when you use the Acrobatics skill to Balance on narrow surfaces or uneven ground made of stone or earth, you aren't flat-footed, and when you roll a success at one of these Acrobatics checks, you get a critical success instead.",
            level=1,
            pgnum=36,
            book=book,
            tags=[list_tag_id[1].id, list_tag_id[0].id],
            ),
        fodels.Feat(
            name='Stone Cunning',
            description="You have a knack for noticing even small inconsistencies and craftsmanship techniques in the stonework around you. You gain a +2 circumstance bonus to Perception checks to notice unusual stonework. This bonus applies to checks to discover mechanical traps made of stone or hidden within stone. If you aren't using the Seek action or searching, the GM automatically rolls a secret check for you to notice unusual stonework anyway. This check doesn't gain the circumstance bonus, and it takes a –2 circumstance penalty.",
            level=1,
            pgnum=36,
            book=book,
            tags=[list_tag_id[1].id, list_tag_id[0].id],
            ),
        fodels.Feat(
            name='Unburdened Iron',
            description="You've learned techniques first devised by your ancestors during their ancient wars, allowing you to comfortably wear massive suits of armor. Ignore the reduction to your Speed from any armor you wear. In addition, any time you're taking a penalty to your Speed from some other reason (such as from the encumbered condition or from a spell), deduct 5 feet from the penalty. For example, the encumbered condition normally gives a –10-foot penalty to Speed, but it gives you only a –5-foot penalty. If your Speed is taking multiple penalties, pick only one penalty to reduce.",
            level=1,
            pgnum=36,
            book=book,
            tags=[list_tag_id[1].id, list_tag_id[0].id],
            ),
        fodels.Feat(
            name='Vengeful Hatred',
            description="You heart aches for vengeance against those who have wronged your people. Choose one of the following dwarven ancestral foes when you gain Vengeful Hatred: drow, duergar, giant, or orc. You gain a +1 circumstance bonus to damage with weapons and unarmed attacks against creatures with that trait. If your attack would deal more than one weapon die of damage (as is common at higher levels than 1st), the bonus is equal to the number of weapon dice or unarmed attack dice. In addition, if a creature critically succeeds at an attack against you and deals damage to you, you gain your bonus to damage against that creature for 1 minute regardless of whether it has the chosen trait. Special Your GM can add appropriate creature traits to the ancestral foes list if your character is from a community that commonly fights other types of enemies.",
            level=1,
            pgnum=36,
            book=book,
            tags=[list_tag_id[1].id, list_tag_id[0].id],
            ),
        # Boulder Roll Requires Rock Runner and is an Action
        fodels.Feat(
            name='Boulder Roll',
            description="Your dwarven build allows you to push foes around, just like a mighty boulder tumbles through a subterranean cavern. Take a Step into the square of a foe that is your size or smaller, and the foe must move into the empty space directly behind it. The foe must move even if doing so places it in harm's way. The foe can attempt a Fortitude saving throw against your Athletics DC to block your Step. If the foe attempts this saving throw, unless it critically succeeds, it takes bludgeoning damage equal to your level plus your Strength modifier. If the foe can't move into an empty space (if it is surrounded by solid objects or other creatures, for example), your Boulder Roll has no effect.",
            level=5,
            pgnum=36,
            book=book,
            tags=[list_tag_id[1].id, list_tag_id[0].id],
            ),
        # Dwarven Weapon Cunning requires Dwarven Weapon Familiarity
        fodels.Feat(
            name='Dwarven Weapon Cunning',
            description="You've learned cunning techniques to get the best effects out of your dwarven weapons. Whenever you critically hit using a battle axe, pick, warhammer, or a dwarf weapon, you apply the weapon's critical specialization effect.",
            level=5,
            pgnum=37,
            book=book,
            tags=[list_tag_id[1].id, list_tag_id[0].id],
            ),
        fodels.Feat(
            name="Mountain's Stoutness",
            description="Your hardiness lets you withstand more punishment than most before going down. Increase your maximum Hit Points by your level. You also decrease the DC of recovery checks when you have the dying condition by 1. If you also have the Toughness feat, the Hit Points gained from it and this feat are cumulative, and you decrease the DC of recovery checks by 4.",
            level=9,
            pgnum=37,
            book=book,
            tags=[list_tag_id[1].id, list_tag_id[0].id],
            ),
        fodels.Feat(
            name='Stonewalker',
            description="You have a deep reverence for and connection to stone. You gain meld into stone as a 3rd‑level divine innate spell that you can cast once per day. If you have the Stonecunning dwarf ancestry feat, you can attempt to find unusual stonework and stonework traps that require legendary proficiency in Perception. If you have both Stonecunning and legendary proficiency in Perception, when you're not Seeking and the GM rolls a secret check for you to notice unusual stonework, you keep the bonus from Stonecunning and don't take the –2 circumstance penalty.",
            level=9,
            pgnum=37,
            book=book,
            tags=[list_tag_id[1].id, list_tag_id[0].id],
            ),
        # Dwarven Weapon Expertise requires Dwarven Weapon Familiarity    
        fodels.Feat(
            name='Dwarven Weapon Expertise',
            description="Your dwarven affinity blends with your training, granting you great skill with dwarven weapons. Whenever you gain a class feature that grants you expert or greater proficiency in certain weapons, you also gain that proficiency for battle axes, picks, warhammers, and all dwarven weapons in which you are trained.",
            level=13,
            pgnum=37,
            book=book,
            tags=[list_tag_id[1].id, list_tag_id[0].id],
            ),
        fodels.Feat(
            name='Additional Lore',
            description="Your knowledge has expanded to encompass a new field. Choose an additional Lore skill subcategory. You become trained in it. At 3rd, 7th, and 15th levels, you gain an additional skill increase you can apply only to the chosen Lore subcategory. Special You can select this feat more than once. Each time you must select a new subcategory of Lore and you gain the additional skill increases to that subcategory for the listed levels.",
            level=1,
            pgnum=258,
            book=book,
            tags= [list_tag_id[3].id, list_tag_id[2].id],
        )
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


def CreateClasses():
    book="Player's Core Rulebook"
    data_class = ClassModel.PathClass(
        name='Alchemist',
        hit_points=8,
        key_ability='INT',
        pgnum=71,
        book=book,
    )
    data_class.save()
    data_features = [
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Ancestry and Background",
            description="In addition to the abilities provided by your class at 1st level, you have the benefits of your selected ancestry and background, as described in Chapter 2.",
            level=1,
            pgnum=72,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Initial Proficiencies",
            description="At 1st level, you gain a number of proficiencies that represent your basic training. These proficiencies are noted at the start of this class.",
            level=1,
            pgnum=72,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Alchemy",
            description="You understand the complex interactions of natural and unnatural substances and can concoct alchemical items to meet your needs. You can do this using normal reagents and the Craft activity, or you can use special infused reagents that allow you to craft temporary items quickly and at no cost. Over time, you can create more and more alchemical items for free, and since each of them becomes more and more powerful, you advance in power dramatically, leaving behind those who don't understand your strange science. You gain the Alchemical Crafting feat (page 258), even if you don't meet that feat's prerequisites, and you gain the four common 1st-level alchemical formulas granted by that feat. The catalog of alchemical items begins on page 543. You can use this feat to create alchemical items as long as you have the items' formulas in your formula book.",
            level=1,
            pgnum=72,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Infused Reagents",
            description="You infuse reagents with your own alchemical essence, allowing you to create alchemical items at no cost. Each day during your daily preparations, you gain a number of batches of infused reagents equal to your level + your Intelligence modifier. You can use these reagents for either advanced alchemy or Quick Alchemy, described below. Together, these infused reagents have light Bulk. As soon as you make your next daily preparations, your infused reagents from the previous day's preparations are instantly destroyed, and nonpermanent effects of your previous day's infused items immediately end. While infused reagents are physical objects, they can't be duplicated, preserved, or created in any way other than your daily preparations. Any such artificial reagents lack the infusion and are useless for advanced alchemy or Quick Alchemy.",
            level=1,
            pgnum=72,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Advanced Alchemy",
            description="During your daily preparations, after producing new infused reagents, you can spend batches of those infused reagents to create infused alchemical items. You don't need to attempt a Crafting check to do this, and you ignore both the number of days typically required to create the items and any alchemical reagent requirements. Your advanced alchemy level is equal to your level. For each batch of infused reagents you spend, choose an alchemical item of your advanced alchemy level or lower that's in your formula book, and make a batch of two of that item. These items have the infused trait and remain potent for 24 hours or until your next daily preparations, whichever comes first.",
            level=1,
            pgnum=72,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Quick Alchemy",
            description="If you need a specific alchemical item on the fly, you can use your infused reagents to quickly create it with the Quick Alchemy action.",
            level=1,
            pgnum=72,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Formula Book",
            description="An alchemist keeps meticulous records of the formulas for every item they can create. You start with a standard formula book worth 10 sp or less (as detailed on page 290) for free. The formula book contains the formulas for two common 1st-level alchemical items of your choice, in addition to those you gained from Alchemical Crafting and your research field. The catalog of alchemical items begins on page 543. Each time you gain a level, you can add the formulas for two common alchemical items to your formula book. These new formulas can be for any level of item you can create. You learn these formulas automatically, but it's also possible to find or buy additional formulas in settlements or from other alchemists, or to invent them with the Inventor feat (page 262).",
            level=1,
            pgnum=73,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Research Field",
            description="Your inquiries into the alchemical nature of the universe have led you to focus on a particular field of research. You might have a degree from an scientific institute, correspond with other researchers in your field, or work as a genius loner. Choose a field of research. The research fields presented in this book are as follows.",
            level=1,
            pgnum=73,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Alchemist Feats",
            description="At 1st level and every even-numbered level thereafter, you gain an alchemist class feat. Alchemist class feats are described beginning on page 76. ",
            level=1,
            pgnum=73,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Skill Feats",
            description="At 2nd level and every 2 levels thereafter, you gain a skill feat. Skill feats can be found in Chapter 5 and have the skill trait. You must be trained or better in the corresponding skill to select a skill feat.",
            level=2,
            pgnum=73,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="General Feats",
            description="At 3rd level and every 4 levels thereafter, you gain a general feat. General feats are listed in Chapter 5. ",
            level=2,
            pgnum=73,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Skill Increases",
            description="At 3rd level and every 2 levels thereafter, you gain a skill increase. You can use this increase either to increase your proficiency rank to trained in one skill you're untrained in, or to increase your proficiency rank in one skill in which you're already trained to expert. At 7th level, you can use skill increases to increase your proficiency rank to master in a skill in which you're already an expert, and at 15th level, you can use them to increase your proficiency rank to legendary in a skill in which you're already a master.",
            level=3,
            pgnum=74,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Ability Boosts",
            description="At 5th level and every 5 levels thereafter, you boost four different ability scores. You can use these ability boosts to increase your ability scores above 18. Boosting an ability score increases it by 1 if it's already 18 or above, or by 2 if it starts out below 18.",
            level=5,
            pgnum=74,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Ancestry Feats",
            description="In addition to the ancestry feat you started with, you gain an ancestry feat at 5th level and every 4 levels thereafter. The list of ancestry feats available to you can be found in your ancestry's entry in Chapter 2.",
            level=5,
            pgnum=74,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Field Discovery",
            description="You learn a special discovery depending on your field.\nBomber: When using advanced alchemy to make bombs during your daily preparations, you can use a batch of reagents to create any three bombs instead of just two of the same bomb.\nChirurgeon: When using advanced alchemy to make elixirs of life during your daily preparations, you can create three elixirs with each batch of reagents instead of two.\nMutagenist: When using advanced alchemy to make mutagens during your daily preparations, you can use a batch of reagents to create any three mutagens instead of just two of the same mutagen.",
            level=5,
            pgnum=74,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Alchemical Weapon Expertise",
            description="You've trained to more effectively wield the weapons you find in your lab. Your proficiency ranks for simple weapons and alchemical bombs increase to expert.",
            level=7,
            pgnum=74,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Iron Will",
            description="Your mental defenses are an iron fortress. Your proficiency rank for Will saves increases to expert.",
            level=7,
            pgnum=74,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Perpetual Infusions",
            description="You have learned how to create perpetual alchemical infusions that can provide a near-infinite supply of certain simple items. You gain the ability to create two 1st-level alchemical items using Quick Alchemy without spending a batch of infused reagents. The items you can select depend on your research field and must be in your formula book.\nBomber: Choose two of the following formulas: lesser acid flask, lesser alchemist's fire, lesser bottled lightning, lesser liquid ice, lesser tanglefoot bag, lesser thunderstone.\nChirurgeon: Lesser antidote and lesser antiplague.\nMutagenist: Choose two of the following formulas: lesser bestial mutagen, lesser bullheaded mutagen, lesser cognitive mutagen, lesser juggernaut mutagen, lesser quicksilver mutagen, lesser silvertongue mutagen.",
            level=7,
            pgnum=74,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Alchemical Expertise",
            description="Constant practice has increased the effectiveness of your concoctions. Your proficiency rank for your alchemist class DC increases to expert.",
            level=9,
            pgnum=75,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Alertness",
            description="You remain alert to threats around you. Your proficiency rank for Perception increases to expert.",
            level=9,
            pgnum=75,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Double Brew",
            description="You know your formulas so well that you can concoct two items at once. When using the Quick Alchemy action, instead of spending one batch of infused reagents to create a single item, you can spend up to two batches of infused reagents to make up to two alchemical items as described in that action. These items do not have to be the same.",
            level=9,
            pgnum=75,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Juggernaut",
            description="Your body has become accustomed to physical hazards and resistant to pathogens and ailments. Your proficiency rank for Fortitude saves increases to master. When you roll a success on a Fortitude save, you get a critical success instead.",
            level=11,
            pgnum=75,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Perpetual Potency",
            description="Your perpetual infusions improve, allowing you to use Quick Alchemy to create more powerful items with no cost. The items you can select depend on your research field and must be in your formula book.\nBomber: The moderate versions of the bombs you chose for perpetual infusions. \nChirurgeon: Moderate antidote and antiplague. \nMutagenist: The moderate versions of the mutagens you chose for perpetual infusions. ",
            level=11,
            pgnum=75,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Greater Field Discovery",
            description="You learn an incredible discovery that advances your understanding of your field.\nBomber: You can increase the splash on your bombs to damage creatures within 10 feet, or 15 feet if you have Expanded Splash.\nChirurgeon: When you use Quick Alchemy to create any type of elixir of life, the creature drinking the elixir gains the maximum Hit Points possible for that elixir, instead of rolling to determine the number of Hit Points regained.\nMutagenist: If you imbibe another mutagen while you are under the effects of a mutagen that you created, you can gain the benefits and the drawbacks of both mutagens at once, despite the fact that they both have the polymorph trait and would not normally function together. If you come under the effects of any further mutagens while benefiting from two mutagens, you lose the benefit of one of the former mutagens of your choice, while retaining the drawbacks of all the mutagens. If you are under the effects of two mutagens and you come under the effect of a non-mutagen polymorph effect, you lose the benefits of the mutagens while retaining the drawbacks of both.",
            level=13,
            pgnum=75,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Light Armor Expertise",
            description="You've learned how to dodge while wearing light or no armor. Your proficiency ranks for light armor and unarmored defense increase to expert.",
            level=13,
            pgnum=75,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Weapon Specialization",
            description="You've learned how to inflict greater injuries with the weapons you know best. You deal 2 additional damage with weapons and unarmed attacks in which you are an expert. This damage increases to 3 if you're a master, and to 4 if you're legendary.",
            level=13,
            pgnum=75,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Alchemical Alacrity",
            description="Your comfort in concocting items is such that you can create three at a time. When using the Quick Alchemy action, you can spend up to three batches of infused reagents to make up to three alchemical items as described in that action. These items do not have to be the same.",
            level=15,
            pgnum=75,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Evasion",
            description="You've learned to move quickly to avoid explosions, dragon's breath, and worse. Your proficiency rank for Reflex saves increases to master. When you roll a success on a Reflex save, you get a critical success instead.",
            level=15,
            pgnum=76,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Alchemical Mastery",
            description="Your alchemical concoctions are incredibly effective. Your proficiency rank for your alchemist class DC increases to master.",
            level=17,
            pgnum=76,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Perpetual Perfection",
            description="You have perfected your perpetual infusions, allowing you to use Quick Alchemy to create even more powerful items at no cost. The items you can select depend on your research field and must be in your formula book.\nBomber: The greater versions of the bombs you chose for perpetual infusions.\nChirurgeon: Greater antidote and antiplague.\nMutagenist: The greater versions of the mutagens you chose for perpetual infusions.",
            level=17,
            pgnum=76,
            book=book,
        ),
        ClassModel.PathClassFeature(
            path_class=data_class,
            name="Light Armor Mastery",
            description="Your skill with light armor improves, increasing your ability to dodge blows. Your proficiency ranks for light armor and unarmored defense increase to master.",
            level=19,
            pgnum=76,
            book=book,
        ),

    ]

    data_tag = fodels.Tag.objects.all().filter(id__exact=6).first()
    data_class_feat = fodels.Feat(
        name='Alchemical Familiar',
        description="Your knowledge has expanded to encompass a new field. Choose an additional Lore skill subcategory. You become trained in it. At 3rd, 7th, and 15th levels, you gain an additional skill increase you can apply only to the chosen Lore subcategory. Special You can select this feat more than once. Each time you must select a new subcategory of Lore and you gain the additional skill increases to that subcategory for the listed levels.",
        level=1,
        pgnum=258,
        book=book,
    )
    data_class_feat.save()
    relationship = fodels.Feat.tags.through(feat_id=data_class_feat.id, tag_id=data_tag.id)
    relationship.save()
    data_archetypes = [
        ClassModel.PathClassArchetype(
            name="Bomber",
            description="You specialize in explosions and other violent alchemical reactions. You start with the formulas for two 1st-level alchemical bombs in your formula book, in addition to your other formulas. When throwing an alchemical bomb with the splash trait, you can deal splash damage to only your primary target instead of the usual splash area.",
            path_class=data_class,
            pgnum=73,
            book=book,
        ),
        ClassModel.PathClassArchetype(
            name="Chirurgeon",
            description="You concentrate on healing others with alchemy. You start with the formulas for two of the following in your formula book, in addition to your other formulas: lesser antidote, lesser antiplague, or lesser elixir of life. As long as your proficiency rank in Medicine is trained or better, you can attempt a Crafting check instead of a Medicine check for any of Medicine's untrained and trained uses.",
            path_class=data_class,
            pgnum=73,
            book=book,
        ),
        ClassModel.PathClassArchetype(
            name="Mutagenist",
            description="You focus on bizarre mutagenic transformations that sacrifice one aspect of a creature's physical or psychological being in order to strengthen another. You start with the formulas for two 1st-level mutagens in your formula book, in addition to your other formulas. You can gain the benefit of any mutagen, even if it wasn't specifically brewed for you. Whenever your proficiency rank for simple weapons increases, your proficiency rank for unarmed attacks increases to the same rank unless it's already better. ",
            path_class=data_class,
            pgnum=73,
            book=book,
        ),
    ]
    ClassModel.PathClassArchetype.objects.bulk_create(data_archetypes)
    ClassModel.PathClassFeature.objects.bulk_create(data_features)

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
    CreateClasses()
