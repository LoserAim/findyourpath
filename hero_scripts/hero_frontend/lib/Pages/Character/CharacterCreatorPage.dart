import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/CharacterProvider.dart';
import 'package:hero_frontend/Widgets/Generics/NameDetailWidget.dart';

class Character_Creator_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Character_Provider.of(context);
    double ancestryProgress = 0.0;
    if(bloc.returnCurrentAncestry != null) ancestryProgress += 0.33;
    if(bloc.returnCurrentAncestryFeats != null) ancestryProgress += 0.33;
    if(bloc.returnCurrentHeritage != null) ancestryProgress += 0.33;
    if(ancestryProgress == 0.99) ancestryProgress = 1.0;
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
              builder: (BuildContext context, AsyncSnapshot snapshot){
                return NameDetail_Widget(
                name: "Choose Your Ancestry",
                description: "Incomplete",
                routepath: "/Ancestries",
                icon: Icon(Icons.account_circle, color: Theme.of(context).iconTheme.color),
                progress: ancestryProgress,

                );
              },
            ),
          ],
        ),
      ),
    );
  }
}