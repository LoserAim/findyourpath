import 'package:flutter/material.dart';
import 'package:hero_frontend/Feat/Providers/FeatProvider.dart';
import 'package:hero_frontend/Feat/Widgets/CardWidget.dart';
import 'package:hero_frontend/Settings/TextFormat.dart';

class FeatSelectorPage extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    final bloc = FeatProvider.of(context);
    return new Scaffold(
      appBar: new AppBar(
        title: Align(
            alignment: Alignment.center,
            child: Container(
                child: new Text(
              "Feats",
              style: text_format.display4,
            ))),
      ),
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
              return FeatCardWidget(
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
