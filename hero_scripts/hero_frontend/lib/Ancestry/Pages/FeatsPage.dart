import 'package:flutter/material.dart';
import 'package:hero_frontend/Ancestry/Models/Ancestry.dart';
import 'package:hero_frontend/Ancestry/Providers/AncestryDetailProvider.dart';
import 'package:hero_frontend/Widgets/Generics/GenericInfoCardWidget.dart';

class AncestryFeatsPage extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    final ancestrybloc = AncestryDetailProvider.of(context);
    return new ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          StreamBuilder(
            stream: ancestrybloc.ancestry,
            builder: (BuildContext context, AsyncSnapshot<Ancestry> snapshot) {
              if (!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data.feats.length,
                itemBuilder: (BuildContext context, int index) {
                  if (snapshot.data.feats[index].level == 1)
                    return Generic_Info_Card_Widget(
                      item: snapshot.data.feats[index],
                      stream: ancestrybloc.chosenFeats,
                      addToStream: ancestrybloc.changeChosenFeats,
                    );
                },
              );
            },
          ),
        ],
      
    );
  }
}
