import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Blocs/CharacterBloc.dart';
import 'package:hero_frontend/BusinessLogic/Providers/AncestryDetailProvider.dart';
import 'package:hero_frontend/BusinessLogic/Providers/CharacterProvider.dart';
import 'package:hero_frontend/BusinessLogic/Providers/FeatListProvider.dart';
import 'package:hero_frontend/Models/AncestryModel.dart';
import 'package:hero_frontend/Models/FeatModel.dart';
import 'package:hero_frontend/Pages/Ancestry/AncestryFeatsPage.dart';
import 'package:hero_frontend/Pages/Ancestry/AncestryHeritagePage.dart';
import 'package:hero_frontend/Widgets/Ancestry/AncestryDetailWidget.dart';

class Ancestry_Detail_Page extends StatelessWidget {
  final int itemId;
  Ancestry_Detail_Page({this.itemId});
  @override
  Widget build(BuildContext context) {
    final character_bloc = Character_Provider.of(context);
    final feat_bloc = Feat_List_Provider.of(context);
    final bloc = Ancestry_Detail_Provider.of(context);
    return StreamBuilder(
      stream: bloc.ancestry,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(
                      icon: Icon(Icons.account_box),
                      text: "General",
                    ),
                    Tab(
                      icon: Icon(Icons.assignment),
                      text: "Heritages",
                    ),
                    Tab(icon: Icon(Icons.book), text: "Feats"),
                  ],
                ),
                title: Text(snapshot.data.name),
              ),
              body: TabBarView(
                children: [
                  Ancestry_Detail_Widget(),
                  Ancestry_Heritage_Page(),
                  Ancestry_Feats_Page(),
                ],
              ),
              floatingActionButton: new FloatingActionButton(
                onPressed: () async {
                  final Ancestry itemAncestry = bloc.returnCurrentAncestry;
                  final List<Feat> itemFeats =
                      feat_bloc.returnCurrentChosenFeats;
                  final Heritage itemHeritage = bloc.returnCurrentHeritage;
                  final List<String> itemAboosts = (itemAncestry != null)
                      ? bloc.returnChosenAbilityBoosts
                      : null;
                  final List<String> itemAFlaws = (itemAncestry != null)
                      ? itemAncestry.ability_flaws
                      : null;
                  List<String> alert = List();
                  if(itemAboosts == null || itemAboosts.length == 0)
                    alert.add("Please pick an ability boost");
                  if (itemHeritage == null || itemHeritage.id == null)
                    alert.add("Please pick a heritage!");
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
                    await character_bloc.changeChosenABoosts(itemAboosts);
                    await character_bloc.changeChosenAFlaws(itemAFlaws);
                    await character_bloc.changeChosenAncestry(itemAncestry);
                    await character_bloc.changeChosenHeritage(itemHeritage);
                    await character_bloc.changeChosenAncestryFeats(itemFeats);
                    Future.delayed(Duration.zero, () {
                      Navigator.popUntil(
                          context, ModalRoute.withName('/Characters'));
                    });
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
