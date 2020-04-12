import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/AncestryDetailProvider.dart';
import 'package:hero_frontend/BusinessLogic/Providers/ClassProvider.dart';
import 'package:hero_frontend/BusinessLogic/Providers/FeatListProvider.dart';
import 'package:hero_frontend/Models/AncestryModel.dart';
import 'package:hero_frontend/Settings/TextFormat.dart';
import 'package:hero_frontend/Widgets/Feats/FeatCardWidget.dart';
import 'package:hero_frontend/Widgets/Generics/GenericInfoCardWidget.dart';

class Ancestry_Feats_Page extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    final ancestrybloc = Ancestry_Detail_Provider.of(context);
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
