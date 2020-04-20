

import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/CharacterProvider.dart';
import 'package:hero_frontend/BusinessLogic/Providers/ClassProvider.dart';
import 'package:hero_frontend/BusinessLogic/Providers/FeatListProvider.dart';
import 'package:hero_frontend/Models/FeatModel.dart';
import 'package:hero_frontend/Models/PathClassModel.dart';
import 'package:hero_frontend/Pages/Classes/ClassArchetypesPage.dart';
import 'package:hero_frontend/Pages/Classes/ClassFeatsPage.dart';
import 'package:hero_frontend/Pages/Classes/ClassFeaturePage.dart';
import 'package:hero_frontend/Pages/Classes/ClassSelectorPage.dart';
import 'package:hero_frontend/Pages/Feat/FeatSelectorPage.dart';
import 'package:hero_frontend/Widgets/Class/ClassDetailWidget.dart';

class Class_Tabs_Page extends StatelessWidget {
  final Map<String, String> _modifierChoices = {
    'STR': 'Strength',
    'DEX': 'Dexterity',
    'CON': 'Constitution',
    'INT': 'Intelligence',
    'WIS': 'Wisdom',
    'CHA': 'Charisma',
    'N/A': 'NULL',
  };

  @override
  Widget build(BuildContext context) {
    final featBloc = Feat_List_Provider.of(context);
    final classBloc = Class_Provider.of(context);
    final characterBloc = Character_Provider.of(context);
    return StreamBuilder(
      stream: classBloc.pathClass,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(!snapshot.hasData) return Center(child: CircularProgressIndicator());
        return DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.assignment_ind), text: "General",),
                    Tab(icon: Icon(Icons.assignment), text: "Archetypes"),
                    Tab(icon: Icon(Icons.dns), text: "Features",),
                    Tab(icon: Icon(Icons.book), text: "Feats",),
                  ],
                ),
                title: Text(snapshot.data.name),
              ),
              body: TabBarView(
                children: [
                  Class_Detail_Widget(),
                  Class_Archetypes_Page(),
                  Class_Feature_Page(),
                  Class_Feats_Page(),
                ],
              ),
              floatingActionButton: new FloatingActionButton(
                onPressed: () async {
                  final Path_Class itemClass = classBloc.returnPathClass;
                  final List<Feat> itemFeats = classBloc.returnChosenFeats;
                  final Archetype itemArchetype =  classBloc.returnChosenArchetype;
                  final List<String> itemCboosts = (itemClass.key_ability != null)
                      ? [_modifierChoices[itemClass.key_ability]]
                      : null;
                  List<String> alert = List();
                  if (itemArchetype == null || itemArchetype.id == null)
                    alert.add("Please pick an archetype!");
                  if (itemFeats == null || itemFeats.length <= 0)
                    alert.add("Please pick at least one feat!");
                  if (alert.length > 0)
                    await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Error While Saving Data"),
                            content: Text(alert.join('\n')),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        });
                  else {
                    await characterBloc.changeChosenCBoosts(itemCboosts);
                    await characterBloc.changeChosenArchetype(itemArchetype);
                    await characterBloc.changeChosenClass(itemClass);
                    await characterBloc.changeChosenClassFeats(itemFeats);

                    Navigator.popUntil(
                          context, ModalRoute.withName('/Characters'));

                  }
                },
                backgroundColor: Theme.of(context).primaryColor,
                tooltip: 'Good To Go',
                child: new Icon(
                  Icons.check,
                  color: Theme.of(context).textTheme.display1.color,
                ),
              ),
            ));
      },
    );
  }
}
