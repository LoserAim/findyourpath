import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/FeatListProvider.dart';
import 'package:hero_frontend/Settings/TextFormat.dart';
import 'package:hero_frontend/Widgets/Feats/FeatCardWidget.dart';

class Class_Feats_Page extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    final bloc = Feat_List_Provider.of(context);
    return new Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          StreamBuilder(
            stream: bloc.topIds,
            builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              return ListView.builder(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
              bloc.fetchItem(snapshot.data[index]);
              return Feat_Card_Widget(
                itemId: snapshot.data[index],
              );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
