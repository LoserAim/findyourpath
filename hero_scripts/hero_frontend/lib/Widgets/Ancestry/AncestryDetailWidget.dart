import 'package:card_settings/card_settings.dart';
import 'package:card_settings/widgets/card_settings_panel.dart';
import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/AncestryDetailProvider.dart';
import 'package:hero_frontend/Widgets/Generics/LoadingContainerWidget.dart';

class Ancestry_Detail_Widget extends StatelessWidget {
  final int itemId;
  final Map<String, String> _sizeDict = { "T":"Tiny", "S":"Small", "M":"Medium", "L":"Large", "H":"Huge"};
  final List<String> _sizeOptions = ["Tiny", "Small", "Medium","Large","Huge"];
  final List<String> _abilities = [""];
  Ancestry_Detail_Widget({this.itemId});
  @override
  Widget build(BuildContext context) {
    final bloc = Ancestry_Detail_Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: bloc.name ,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            return Container(
              child: Text(snapshot.data.toString()),
            );
          },
        ),
      ),
      body: CardSettings(
        children: <Widget>[
          StreamBuilder(
            stream: bloc.name,
            builder: (BuildContext context, AsyncSnapshot snapshot){
              return Container(
                child: CardSettingsHeader( label: "Stats"),
              );
            },
          ),
          StreamBuilder(
            stream: bloc.hitPoints,
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(!snapshot.hasData)
                return Loading_Container_Widget();
              return Container(
                child: CardSettingsInt( 
                  label: "Hit Points",
                  initialValue: snapshot.hasData ? snapshot.data : 0,
                  //onChanged: bloc.changeHitPoints,
                  validator: (value) {
                    if (value == null || value == 0) return "Hit points cannot be 0!";
                  },
                  autovalidate: true,
                  ),
              );
            },
          ),
          StreamBuilder(
            stream: bloc.size,
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(!snapshot.hasData)
                return Loading_Container_Widget();
              return Container(
                child: CardSettingsListPicker( 
                  label: 'Size',
                  initialValue: _sizeDict[snapshot.data],
                  onChanged: bloc.changeSize,
                  options: _sizeOptions,
                  ),
              );
            },
          ),
          // StreamBuilder(
          //   stream: bloc.abilityBoosts,
          //   builder: (BuildContext context, AsyncSnapshot snapshot){
          //     if(!snapshot.hasData)
          //       return Loading_Container_Widget();
          //     return Container(
          //       child: CardSettingsMultiselect( 
          //         label: 'Ability Boosts',
                  
          //         ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}