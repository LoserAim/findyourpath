import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/AncestryDetailProvider.dart';
import 'package:hero_frontend/BusinessLogic/Providers/ClassProvider.dart';
import 'package:hero_frontend/BusinessLogic/Providers/FeatListProvider.dart';
import 'package:hero_frontend/Settings/TextFormat.dart';
import 'package:hero_frontend/Widgets/Feats/FeatCardWidget.dart';

class Ancestry_Feats_Page extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    final featbloc = Feat_List_Provider.of(context);
    final ancestrybloc = Ancestry_Detail_Provider.of(context);
    return new ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          StreamBuilder(
            stream: featbloc.topIds,
            builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
              if (!snapshot.hasData){
                featbloc.fetchAncestryFeatIds(ancestrybloc.returnCurrentAncestry.id);
                return Center(child: CircularProgressIndicator());
              }
                
              return ListView.builder(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
              featbloc.fetchItem(snapshot.data[index]);
              return Feat_Card_Widget(
                itemId: snapshot.data[index],
              );
                },
              );
            },
          ),
        ],
      
    );
  }
}
