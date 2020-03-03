

import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/AncestryListProvider.dart';
import 'package:hero_frontend/BusinessLogic/Providers/CharacterProvider.dart';
import 'package:hero_frontend/Models/AncestryModel.dart';
import 'package:hero_frontend/Settings/TextFormat.dart';
import 'package:hero_frontend/Widgets/Generics/LoadingContainerWidget.dart';

class Ancestry_Card_Widget extends StatelessWidget {
  final int itemId;
  final Map<String, String> _sizeDict = { "T":"Tiny", "S":"Small", "M":"Medium", "L":"Large", "H":"Huge"};
  Ancestry_Card_Widget({this.itemId});
  @override
  Widget build(BuildContext context) {
    final charater_bloc = Character_Provider.of(context);
    final bloc = Ancestry_List_Provider.of(context);
    return StreamBuilder(
      stream: bloc.items,
      builder: (BuildContext context,
          AsyncSnapshot<Map<int, Future<Ancestry>>> snapshot) {
        if (!snapshot.hasData) return Loading_Container_Widget();
        return FutureBuilder(
          future: snapshot.data[itemId],
          builder:
              (BuildContext context, AsyncSnapshot<Ancestry> itemSnapshot) {
            if (!itemSnapshot.hasData) return Loading_Container_Widget();

            return Card(
                elevation: 8.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                  child: ListTile(
                      onTap: () {
                        charater_bloc.changeChosenAncestry(itemSnapshot.data);
                        Navigator.pushNamed(context, '/Ancestries/${itemSnapshot.data.id.toString()}');
                        },
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      title: Text(
                        "${itemSnapshot.data.name}",
                        style: TextStyle(
                            color: Theme.of(context).textTheme.display1.color, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        children: <Widget>[
                          
                          Row(
                            children: <Widget>[
                              Icon(Icons.favorite, color: Theme.of(context).iconTheme.color),
                              Expanded(
                                  child: Center(
                                    child: Text("${itemSnapshot.data.hit_points.toString()}",
                                        style: TextStyle(color: Theme.of(context).textTheme.display1.color)),
                                  ))
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.directions_run, color: Theme.of(context).iconTheme.color),
                              Expanded(
                                  child: Center(
                                    child: Text("${itemSnapshot.data.speed.toString()}",
                                        style: TextStyle(color: Theme.of(context).textTheme.display1.color)),
                                  ))
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.exposure_plus_2, color: Theme.of(context).iconTheme.color),
                              Expanded(
                                  child: Center(
                                    child: Text(itemSnapshot.data.ability_boosts.join(" , "),
                                        style: TextStyle(color: Theme.of(context).textTheme.display1.color)),
                                  ))
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.exposure_neg_2, color: Theme.of(context).iconTheme.color),
                              Expanded(
                                  child: Center(
                                    child: Text(itemSnapshot.data.ability_flaws.join(" , "),
                                        style: TextStyle(color: Theme.of(context).textTheme.display1.color)),
                                  ))
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.accessibility, color: Theme.of(context).iconTheme.color),
                              Expanded(
                                  child: Center(
                                    child: Text("${_sizeDict[itemSnapshot.data.size]}",
                                        style: TextStyle(color: Theme.of(context).textTheme.display1.color)),
                                  ))
                            ],
                          ),
                        ],
                      ),
                      
                )));
          },
        );
      },
    );
  }
}
