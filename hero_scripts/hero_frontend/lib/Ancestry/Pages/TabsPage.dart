import 'package:flutter/material.dart';
import 'package:hero_frontend/Ancestry/Models/Ancestry.dart';
import 'package:hero_frontend/Ancestry/Models/Heritage.dart';
import 'package:hero_frontend/Ancestry/Pages/DetailPage.dart';
import 'package:hero_frontend/Ancestry/Pages/FeatsPage.dart';
import 'package:hero_frontend/Ancestry/Pages/HeritagePage.dart';
import 'package:hero_frontend/Ancestry/Providers/AncestryDetailProvider.dart';
import 'package:hero_frontend/BusinessLogic/Providers/CharacterProvider.dart';
import 'package:hero_frontend/BusinessLogic/Providers/FeatListProvider.dart';
import 'package:hero_frontend/Models/FeatModel.dart';

class AncestryTabsPage extends StatelessWidget {
  final int itemId;
  AncestryTabsPage({this.itemId});
  @override
  Widget build(BuildContext context) {
    final character_bloc = Character_Provider.of(context);
    final feat_bloc = Feat_List_Provider.of(context);
    final bloc = AncestryDetailProvider.of(context);
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
                  AncestryDetailPage(),
                  AncestryHeritagePage(),
                  AncestryFeatsPage(),
                ],
              ),
              floatingActionButton: new FloatingActionButton(
                onPressed: () async {
                  final Ancestry itemAncestry = bloc.returnCurrentAncestry;
                  final List<Feat> itemFeats =
                      bloc.returnChosenFeats;
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
