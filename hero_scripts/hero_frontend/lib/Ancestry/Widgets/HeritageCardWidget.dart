import 'package:flutter/material.dart';
import 'package:hero_frontend/Ancestry/Models/Heritage.dart';
import 'package:hero_frontend/Ancestry/Providers/AncestryDetailProvider.dart';


class HeritageCardWidget extends StatelessWidget {
  final item;
  HeritageCardWidget({this.item});

  @override
  Widget build(BuildContext context) {
    final bloc = AncestryDetailProvider.of(context);
    return Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: StreamBuilder(
            stream: bloc.chosenHeritage,
            builder: (context, AsyncSnapshot<Heritage> snapshot) {
              BoxDecoration decoration = BoxDecoration();
              Color color = Colors.orangeAccent;
              if (!snapshot.hasData) {
                color = Theme.of(context).textTheme.display2.color;
                decoration = BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 1.0),
                );
              } else if (item == snapshot.data) {
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
                    bloc.changeChosenHeritage(item);
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
