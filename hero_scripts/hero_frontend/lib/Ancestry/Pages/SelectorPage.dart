import 'package:flutter/material.dart';
import 'package:hero_frontend/Ancestry/Providers/AncestryListProvider.dart';
import 'package:hero_frontend/Ancestry/Widgets/CardWidget.dart';
import 'package:hero_frontend/Ancestry/Widgets/RefreshWidget.dart';
import 'package:hero_frontend/Settings/TextFormat.dart';

class AncestrySelectorPage extends StatefulWidget {
  AncestrySelectorPage({Key key}) : super(key: key);

  @override
  _AncestrySelectorPageState createState() => _AncestrySelectorPageState();
}

class _AncestrySelectorPageState extends State<AncestrySelectorPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = AncestryListProvider.of(context);
    return new Scaffold(
      appBar: new AppBar(
        title: Align(
            alignment: Alignment.center,
            child: Container(
                child: new Text(
              "Ancestries",
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
              return RefreshWidget(
                  child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  bloc.fetchItem(snapshot.data[index]);
                  return AncestryCardWidget(
                    itemId: snapshot.data[index],
                  );
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}
