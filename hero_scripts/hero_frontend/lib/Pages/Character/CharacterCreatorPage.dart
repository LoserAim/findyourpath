import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/CharacterProvider.dart';
import 'package:hero_frontend/BusinessLogic/Providers/FeatListProvider.dart';
import 'package:hero_frontend/Models/FeatModel.dart';
import 'package:hero_frontend/Widgets/Generics/NameDetailWidget.dart';

class Character_Creator_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Character_Provider.of(context);

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
                final featBloc = Feat_List_Provider.of(context);
                featBloc.changeChosenFeats(List<Feat>());
                double progressValue = 0.0;
                String progressStatus = "Incomplete";
                if (bloc.returnCurrentAncestry != null && bloc.returnCurrentAncestry.id != null)
                  progressValue += 0.33;
                if (bloc.returnCurrentAncestryFeats != null && bloc.returnCurrentAncestryFeats.length > 0)
                  progressValue += 0.33;
                if (bloc.returnCurrentHeritage != null && bloc.returnCurrentHeritage.id != null)
                  progressValue += 0.33;
                if (progressValue == 0.99) {
                  progressValue = 1.0;
                  progressStatus = "Choice: " + bloc.returnCurrentAncestry.name.toString();
                }
                return NameDetail_Widget(
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
                final featBloc = Feat_List_Provider.of(context);
                featBloc.changeChosenFeats(List<Feat>());
                double progressValue = 0.0;
                String progressStatus = "Incomplete";
                if (bloc.returnCurrentClass != null && bloc.returnCurrentClass.id != null)
                  progressValue += 0.33;
                if (bloc.returnCurrentClassFeats != null && bloc.returnCurrentClassFeats.length > 0)
                  progressValue += 0.33;
                if (bloc.returnCurrentArchetype != null && bloc.returnCurrentArchetype.id != null)
                  progressValue += 0.33;
                if (progressValue == 0.99) {
                  progressValue = 1.0;
                  progressStatus = "Choice: " + bloc.returnCurrentClass.name.toString();
                }
                return NameDetail_Widget(
                  name: "Choose Your Class",
                  description: progressStatus,
                  routepath: "/Classes",
                  icon: Icon(Icons.stars,
                      color: Theme.of(context).iconTheme.color),
                  progress: progressValue,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
