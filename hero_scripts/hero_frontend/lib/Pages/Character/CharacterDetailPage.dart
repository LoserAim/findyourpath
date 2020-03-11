import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/CharacterProvider.dart';

class Character_Detail_Page extends StatelessWidget {
  final List<String> _alignments = [
    'Lawful Good',
    'Neutral Good',
    'Chaotic Good',
    'Lawful Neutral',
    'True Neutral',
    'Chaotic Neutral',
    'Lawful Evil',
    'Neutral Evil',
    'Chaotic Evil',
  ];
  final List<String> _abilities = [
    "Strength",
    "Dexterity",
    "Constitution",
    "Intelligence",
    "Wisdom",
    "Charisma",
  ];
  @override
  Widget build(BuildContext context) {
    final bloc = Character_Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Character")),
      ),
      body: CardSettings.sectioned(
        labelWidth: 150.0,
        children: <CardSettingsSection>[
          CardSettingsSection(
            children: <Widget>[
              CardSettingsHeader(
                label: "General Info",
              ),
              StreamBuilder(
                  stream: bloc.name,
                  builder: (context, snapshot) {
                    return CardSettingsText(
                      contentOnNewLine: true,
                      initialValue: snapshot.data ?? '',
                      label: "Character Name",
                      hintText: "Please name your character",
                      onChanged: bloc.changeName,
                      requiredIndicator: Icon(Icons.warning,
                          color: Theme.of(context).textTheme.display3.color),
                    );
                  }),
              StreamBuilder(
                  stream: bloc.playerName,
                  builder: (context, snapshot) {
                    return CardSettingsText(
                      contentOnNewLine: true,
                      label: "Player Name",
                      hintText: "This is where you input your name",
                      onChanged: bloc.changePlayerName,
                    );
                  }),
              StreamBuilder(
                  stream: bloc.deity,
                  builder: (context, snapshot) {
                    return CardSettingsText(
                        contentOnNewLine: true,
                        label: "Deity",
                        hintText: "Please choose a Deity",
                        onChanged: bloc.changeDeity);
                  }),
              CardSettingsField(
                    contentOnNewLine: true,
                    label: "Alignment",
                    content: StreamBuilder(
                      stream: bloc.alignment,
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        if (!snapshot.hasData)
                          return CircularProgressIndicator();
                        List<Widget> choices = List();
                        String current = snapshot.data;
                        _alignments.forEach((item) {
                          choices.add(
                            ChoiceChip(
                              label: Text(item),
                              selected: current.contains(item),
                              onSelected: (selected) => bloc.changeAlignment(item),
                            ),
                          );
                        });

                        return Wrap(
                          children: choices,
                        );
                      },
                    ),
                  )
            ],
          ),
          CardSettingsSection(children: <Widget>[
            StreamBuilder(
              stream: bloc.chosenPBoosts,
              builder: (context, snapshot) {
                return CardSettingsHeader(
                  label: 'You have ' +
                      (((snapshot.data ?? List<String>()).length == 0)
                          ? 4.toString()
                          : (4 - (bloc.returnCurrentPBoosts ?? List<String>()).length).toString()) +
                      ' ability boost(s)',
                );
              }
            ),
            CardSettingsField(
                icon: Icon(Icons.exposure_plus_2),
                contentOnNewLine: true,
                label: "Ability Boosts",
                requiredIndicator: Icon(Icons.warning,
                          color: Theme.of(context).textTheme.display3.color),
                content: StreamBuilder(
                  stream: bloc.chosenPBoosts,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<String>> snapshot) {
                    List<Widget> choices = List();
                    List<String> current = snapshot.data ?? List<String>();
                    _abilities.forEach((item) {
                      choices.add(
                        ChoiceChip(
                          label: Text(item),
                          selected: current.contains(item),
                          onSelected: (selected) {
                            current.contains(item)
                                ? current.remove(item)
                                : (current.length < 4)
                                    ? current.add(item)
                                    : null;
                            bloc.changeChosenPBoosts(current);
                          },
                        ),
                      );
                    });

                    return Wrap(
                      children: choices,
                    );
                  },
                )),
          ])
        ],
      ),
      floatingActionButton: new FloatingActionButton(
                onPressed: () async {
                  
                  List<String> alert = List();
                  if(bloc.returnName == null || bloc.returnName.length == 0)
                    alert.add("Please write a character name");
                  if (bloc.returnCurrentPBoosts == null || bloc.returnCurrentPBoosts.length == 0 || bloc.returnCurrentPBoosts.length < 4)
                    alert.add("Please pick all of your ability boosts!");
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
                    Navigator.pop(context);
                  }
                },
                backgroundColor: Theme.of(context).primaryColor,
                tooltip: 'Good To Go',
                child: new Icon(
                  Icons.check,
                  color: Theme.of(context).textTheme.display1.color,
                ),
              ),
    );
  }
}
