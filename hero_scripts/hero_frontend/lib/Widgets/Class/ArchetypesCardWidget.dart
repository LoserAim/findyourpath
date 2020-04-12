import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/ClassProvider.dart';
import 'package:hero_frontend/Models/PathClassModel.dart';
import 'package:hero_frontend/Widgets/Generics/LoadingContainerWidget.dart';

class Archetypes_Card_Widget extends StatelessWidget {
  final Archetype item;
  Archetypes_Card_Widget({this.item});
//
  @override
  Widget build(BuildContext context) {
    final bloc = Class_Provider.of(context);

    return Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: StreamBuilder(
            stream: bloc.chosenArchetypes,
            builder: (context, AsyncSnapshot<Archetype> snapshot) {
              BoxDecoration decoration = BoxDecoration();
              Color color = Theme.of(context).cardColor;

              if (snapshot.data == item) {
                decoration =
                    BoxDecoration(color: Theme.of(context).primaryColor);
                color = Theme.of(context).textTheme.display1.color;
              } else {
                color = Theme.of(context).textTheme.display2.color;
                decoration = BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 1.0),
                );
              }

              return Container(
                decoration: decoration,
                child: ListTile(
                  onTap: () {
                    bloc.changeChosenArchetypes(item);
                  },
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  title: Text(
                    "${item.name}",
                    style: TextStyle(color: color, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text("${item.description}",
                              style: TextStyle(color: color)))
                    ],
                  ),
                ),
              );
            }));
  }
}
