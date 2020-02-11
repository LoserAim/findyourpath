import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/FeatListProvider.dart';
import 'package:hero_frontend/Models/FeatModel.dart';
import 'package:hero_frontend/Settings/TextFormat.dart';
import 'package:hero_frontend/Widgets/Generics/LoadingContainerWidget.dart';

class Feat_Card_Widget extends StatelessWidget {
  final int itemId;

  Feat_Card_Widget({this.itemId});

  @override
  Widget build(BuildContext context) {
    final bloc = Feat_List_Provider.of(context);
    return StreamBuilder(
      stream: bloc.items,
      builder: (BuildContext context,
          AsyncSnapshot<Map<int, Future<Feat>>> snapshot) {
        if (!snapshot.hasData) return Loading_Container_Widget();
        return FutureBuilder(
          future: snapshot.data[itemId],
          builder: (BuildContext context, AsyncSnapshot<Feat> itemSnapshot) {
            if (!itemSnapshot.hasData) return Loading_Container_Widget();

            return Card(
              
              elevation: 5.0,
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, '/id=$itemId'),
                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "${itemSnapshot.data.level.toString()} ${itemSnapshot.data.name}",
                        style: text_format.display3,
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
                                text: 'Description: \t', style: text_format.body2),
                            TextSpan(
                              text: itemSnapshot.data.description.toString(),
                              style: text_format.body1,
                            )
                          ])),
                        ),
                      ),
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
