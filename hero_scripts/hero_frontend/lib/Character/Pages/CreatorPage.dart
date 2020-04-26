
import 'package:flutter/material.dart';
import 'package:hero_frontend/Character/Models/Ability.dart';
import 'package:hero_frontend/Character/Models/Character.dart';
import 'package:hero_frontend/Character/Providers/CharacterProvider.dart';
import 'package:hero_frontend/Feat/Models/Feat.dart';
import 'package:hero_frontend/Feat/Providers/FeatProvider.dart';
import 'package:hero_frontend/Services/apihandler.dart';
import 'package:hero_frontend/Widgets/NameDetailWidget.dart';

class CharacterCreatorPage extends StatelessWidget {
  final Map<String, String> _alignments = {
    'Lawful Good':'LG',
    'Neutral Good':'NG',
    'Chaotic Good':'CG',
    'Lawful Neutral':'LN',
    'True Neutral':'TN',
    'Chaotic Neutral':'CN',
    'Lawful Evil':'LE',
    'Neutral Evil':'NE',
    'Chaotic Evil':'CE',
  };

  @override
  Widget build(BuildContext context) {
    final bloc = CharacterProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Character Creation"),
      ),
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              stream: bloc.chosenAncestry,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                double progressValue = 0.0;
                String progressStatus = "Incomplete";
                if (bloc.returnCurrentAncestry != null &&
                    bloc.returnCurrentAncestry.id != null)
                  progressValue += 0.33;
                if (bloc.returnCurrentAncestryFeats != null &&
                    bloc.returnCurrentAncestryFeats.length > 0)
                  progressValue += 0.33;
                if (bloc.returnCurrentHeritage != null &&
                    bloc.returnCurrentHeritage.id != null)
                  progressValue += 0.33;
                if (progressValue == 0.99) {
                  progressValue = 1.0;
                  progressStatus =
                      "Choice: " + bloc.returnCurrentAncestry.name.toString();
                }
                return NameDetailWidget(
                  name: "Choose Your Ancestry",
                  description: progressStatus,
                  routepath: "/Ancestries",
                  icon: Icon(Icons.account_circle,
                      color: Theme.of(context).iconTheme.color),
                  progress: progressValue,
                );
              },
            ),
            StreamBuilder(
              stream: bloc.chosenClass,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                double progressValue = 0.0;
                String progressStatus = "Incomplete";
                if (bloc.returnCurrentClass != null &&
                    bloc.returnCurrentClass.id != null) progressValue += 0.33;
                if (bloc.returnCurrentClassFeats != null &&
                    bloc.returnCurrentClassFeats.length > 0)
                  progressValue += 0.33;
                if (bloc.returnCurrentArchetype != null &&
                    bloc.returnCurrentArchetype.id != null)
                  progressValue += 0.33;
                if (progressValue == 0.99) {
                  progressValue = 1.0;
                  progressStatus =
                      "Choice: " + bloc.returnCurrentClass.name.toString();
                }
                return NameDetailWidget(
                  name: "Choose Your Class",
                  description: progressStatus,
                  routepath: "/Classes",
                  icon: Icon(Icons.stars,
                      color: Theme.of(context).iconTheme.color),
                  progress: progressValue,
                );
              },
            ),
            StreamBuilder(
              stream: bloc.name,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                double progressValue = 0.0;
                String progressStatus = "Incomplete";
                if (bloc.returnName != null && bloc.returnName.length > 0)
                  progressValue += 0.33;
                if (bloc.returnDeity != null && bloc.returnDeity.length > 0)
                  progressValue += 0.33;
                if (bloc.alignment != null && bloc.returnDeity.length > 0) {
                  progressValue += 0.33;
                }
                if (progressValue == 0.99)
                  progressStatus = "Choice: " + bloc.returnName;
                return NameDetailWidget(
                  name: "Fill out Generic Information",
                  description: progressStatus,
                  routepath: "/Characters/Info",
                  icon: Icon(Icons.add_comment,
                      color: Theme.of(context).iconTheme.color),
                  progress: progressValue,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Character character = _createCharacter(context, bloc);
          APIservice.postCharacter(character);
          Navigator.pop(context);
        },
        backgroundColor: Colors.brown,
        tooltip: 'Going up',
        child: new Icon(
          Icons.save,
          color: Theme.of(context).textTheme.display1.color,
        ),
      ),
    );
  }

  _createCharacter(context, bloc) {
    Character character = Character();
    character.name = bloc.returnName;
    character.deity = bloc.returnDeity;
    character.playerName = bloc.returnPlayerName;
    character.alignment = _alignments[bloc.returnAlignment];
    character.ancestryFeats = bloc.returnCurrentAncestryFeats;
    character.ancestry = bloc.returnCurrentAncestry;
    character.heritage = bloc.returnCurrentHeritage;
    character.archetype = bloc.returnCurrentArchetype;
    character.classFeats = bloc.returnCurrentClassFeats;
    character.pathClass = bloc.returnCurrentClass;
    character = _createAbilityScores(context, character);
    character.hit_points = bloc.returnCurrentClass.hit_points + bloc.returnCurrentAncestry.hit_points + character.constitution.modifier;
    character.experience = 0;
    return character;  
  }

  _createAbilityScores(BuildContext context, Character character) {
    Map<String, List<int>> _abilities = {
      "Strength": [10],
      "Dexterity": [10],
      "Constitution": [10],
      "Intelligence": [10],
      "Wisdom": [10],
      "Charisma": [10],
    };
    final bloc = CharacterProvider.of(context);
    List<String> boosts = bloc.returnCurrentABoosts;
    boosts.addAll(bloc.returnCurrentCBoosts);
    boosts.addAll(bloc.returnCurrentBBoosts);
    boosts.addAll(bloc.returnCurrentPBoosts);
    List<String> flaws = bloc.returnCurrentAFlaws;
    flaws.forEach((item) {
      if(_abilities.containsKey(item))
        _abilities[item].add(-2);
    });
    boosts.forEach((item) {
      if(_abilities.containsKey(item))
        _abilities[item].add(2);
    });
    _abilities.forEach((k, v) {
      if(k == 'Strength'){
        int temp = 0;
        v.forEach((number) {
          temp += number;
        });
        character.strength = Ability(tempScore:temp);
      }
      if(k == 'Dexterity'){
        int temp = 0;
        v.forEach((number) {
          temp += number;
        });
        character.dexterity = Ability(tempScore:temp);
      }
      if(k == 'Constitution'){
        int temp = 0;
        v.forEach((number) {
          temp += number;
        });
        character.constitution = Ability(tempScore:temp);
      }
      if(k == 'Intelligence'){
        int temp = 0;
        v.forEach((number) {
          temp += number;
        });
        character.intelligence = Ability(tempScore:temp);
      }
      if(k == 'Wisdom'){
        int temp = 0;
        v.forEach((number) {
          temp += number;
        });
        character.wisdom = Ability(tempScore:temp);
      }
      if(k == 'Charisma'){
        int temp = 0;
        v.forEach((number) {
          temp += number;
        });
        character.charisma = Ability(tempScore:temp);
      }
    });
    return character;

  }
}
