import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/ClassProvider.dart';
import 'package:hero_frontend/Models/PathClassModel.dart';
import 'package:hero_frontend/Widgets/Generics/LoadingContainerWidget.dart';

class Archetypes_Card_Widget extends StatelessWidget {
  final int id;
  Archetypes_Card_Widget({this.id});
//
  @override
  Widget build(BuildContext context) {
    final bloc = Class_Provider.of(context);
    return StreamBuilder(
        stream: bloc.archetypes,
        builder: (context, listData) {
          if (!listData.hasData) return CircularProgressIndicator();
          return FutureBuilder(
            future: listData.data[id],
            builder: (context, itemSnapshot) {
              if (!itemSnapshot.hasData) return Loading_Container_Widget();

              return Card(
                  elevation: 8.0,
                  margin:
                      new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: StreamBuilder(
                      stream: bloc.chosenArchetypes,
                      builder: (context, AsyncSnapshot<Archetype> snapshot) {
                        BoxDecoration decoration = BoxDecoration();
                        Color color = Theme.of(context).cardColor;

                        if (snapshot.data == itemSnapshot.data) {
                          decoration = BoxDecoration(
                              color: Theme.of(context).primaryColor);
                          color = Theme.of(context).textTheme.display1.color;
                        } else {
                          color = Theme.of(context).textTheme.display2.color;
                          decoration = BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 1.0),
                          );
                        }

                        return Container(
                          decoration: decoration,
                          child: ListTile(
                            onTap: () {
                              bloc.changeChosenArchetypes(itemSnapshot.data);
                            },
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            title: Text(
                              "${itemSnapshot.data.name}",
                              style: TextStyle(
                                  color: color, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Row(
                              children: <Widget>[
                                Expanded(
                                    child: Text(
                                        "${itemSnapshot.data.description}",
                                        style: TextStyle(color: color)))
                              ],
                            ),
                          ),
                        );
                      }));
            },
          );
        });
  }
}
