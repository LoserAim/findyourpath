import 'package:flutter/material.dart';
import 'package:hero_frontend/Pages/Ancestry/AncestryModel.dart';
import 'package:hero_frontend/Pages/Ancestry/AncestryProvider.dart';
import 'package:hero_frontend/Settings/TextFormat.dart';

class Ancestry_Card_Widget extends StatelessWidget {
  final int itemId;

  Ancestry_Card_Widget({this.itemId});
  @override
  Widget build(BuildContext context) {
    final bloc = Ancestry_Provider.of(context);
    return StreamBuilder(
      stream: bloc.items,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return FutureBuilder(
          future: snapshot.data[itemId],
          builder:
              (BuildContext context, AsyncSnapshot<Ancestry> itemSnapshot) {
            if (!itemSnapshot.hasData)
              return Center(child: CircularProgressIndicator());

            return Card(
              child: InkWell(
                onTap: () => print("You selected ${itemSnapshot.data.name}"),
                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "${itemSnapshot.data.name} Ancestry",
                        style: text_format.display3,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                              //textAlign: TextAlign.left,
                              text: TextSpan(children: [
                            TextSpan(
                                text: 'Health Points: \t',
                                style: text_format.body2),
                            TextSpan(
                              text: itemSnapshot.data.hit_points.toString(),
                              style: text_format.body1,
                            )
                          ])),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: 'Speed: \t', style: text_format.body2),
                            TextSpan(
                              text: itemSnapshot.data.speed.toString(),
                              style: text_format.body1,
                            )
                          ])),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Ability Boosts: ',
                              style: text_format.body2),
                        ),
                        SizedBox(
                          height: 20.0,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  itemSnapshot.data.ability_boosts.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (index !=
                                    itemSnapshot.data.ability_boosts.length - 1)
                                  return Text(
                                      "${itemSnapshot.data.ability_boosts[index]}, ",
                                      style: text_format.body1);
                                else
                                  return Text(
                                      "${itemSnapshot.data.ability_boosts[index]}",
                                      style: text_format.body1);
                              }),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Text('Ability Flaw: ', style: text_format.body2),
                        ),
                        SizedBox(
                          height: 20.0,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: itemSnapshot.data.ability_flaws.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (index !=
                                    itemSnapshot.data.ability_flaws.length - 1)
                                  return Text(
                                      "${itemSnapshot.data.ability_flaws[index]}, ",
                                      style: text_format.body1);
                                else
                                  return Text(
                                      "${itemSnapshot.data.ability_flaws[index]}",
                                      style: text_format.body1);
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
