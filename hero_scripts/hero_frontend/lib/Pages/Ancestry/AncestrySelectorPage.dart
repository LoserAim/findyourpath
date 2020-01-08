import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hero_frontend/Pages/Ancestry/AncestryModel.dart';
import 'package:hero_frontend/Pages/Ancestry/AncestryWidget.dart';
import 'package:hero_frontend/Pages/Feat/FeatModel.dart';
import 'package:hero_frontend/Services/apihandler.dart';
import 'package:hero_frontend/Settings/TextFormat.dart';
import 'package:hero_frontend/Pages/Ancestry/AncestryProvider.dart';

class AncestrySelectorPage extends StatefulWidget {
  AncestrySelectorPage({Key key}) : super(key: key);

  @override
  _AncestrySelectorPageState createState() => _AncestrySelectorPageState();
}

class _AncestrySelectorPageState extends State<AncestrySelectorPage> {
  List<Ancestry> ancestryList = [];

  convertAncestryJson() async {
    APIservice.getAncestryList().then((responseBody) {
      List<dynamic> data = jsonDecode(responseBody);
      setState(() {
        data.forEach((value) {
          ancestryList.add(Ancestry.fromMappedJson(value));
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    convertAncestryJson();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Ancestry_Provider.of(context);
    bloc.fetchTopIds();
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.redAccent.shade700,
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
              if(!snapshot.hasData) {
                print(snapshot.data);
                return Center(child: CircularProgressIndicator());
              }
                
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  bloc.fetchItem(snapshot.data[index]);
                  print(bloc.fetchItem(snapshot.data[index]));
                  return Ancestry_Card_Widget(itemId: snapshot.data[index],);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
