import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/CharacterProvider.dart';

class Character_Detail_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Character_Provider.of(context);
    return Scaffold(appBar: AppBar(title: Center(child: Text("Character")),),
      body: CardSettings.sectioned(
        children: <CardSettingsSection>[
          CardSettingsSection(
            children: <Widget>[
              CardSettingsHeader(label: "General Info",),
              StreamBuilder(
                stream: bloc.name,
                builder: (context, snapshot) {
                  return CardSettingsText(
                    label: "Character Name",
                    hintText: "Please name your character",
                    onChanged: bloc.changeName,
                    requiredIndicator: Icon(Icons.warning, color: Theme.of(context).textTheme.display3.color),
                  );
                }
              ),
              StreamBuilder(
                stream: bloc.playerName,
                builder: (context, snapshot) {
                  return CardSettingsText(
                    label: "Player Name",
                    hintText: "This is where you input your name",
                    onChanged: bloc.changePlayerName,
                  );
                }
              ),
              StreamBuilder(
                stream: bloc.name,
                builder: (context, snapshot) {
                  return CardSettingsInt(
                    label: "Age",
                    hintText: "Please name your character",
                    onChanged: bloc.changeName,
                    requiredIndicator: Icon(Icons.warning, color: Theme.of(context).textTheme.display3.color),
                  );
                }
              ),
              StreamBuilder(
                stream: bloc.name,
                builder: (context, snapshot) {
                  return CardSettingsText(
                    label: "Character Name",
                    hintText: "Please name your character",
                    onChanged: bloc.changeName,
                    requiredIndicator: Icon(Icons.warning, color: Theme.of(context).textTheme.display3.color),
                  );
                }
              ),



            ],
          ),
        ],
      ),
    );
  }
}