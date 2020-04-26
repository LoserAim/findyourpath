import 'package:flutter/material.dart';
import 'package:hero_frontend/PathClass/Providers/ClassProvider.dart';
import 'package:hero_frontend/PathClass/Widgets/CardWidget.dart';
import 'package:hero_frontend/Settings/TextFormat.dart';

class ClassSelectorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = ClassProvider.of(context);
    return new Scaffold(
      appBar: new AppBar(
        title: Align(
            alignment: Alignment.center,
            child: Container(
                child: new Text(
              "Classes",
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
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  bloc.fetchItem(snapshot.data[index]);
                  return ClassCardWidget(itemId: snapshot.data[index],);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}