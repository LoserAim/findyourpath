import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Blocs/FeatListBloc.dart';
export 'package:hero_frontend/BusinessLogic/Blocs/FeatListBloc.dart';

class Feat_List_Provider extends InheritedWidget {
  final Feat_List_Bloc bloc;

  Feat_List_Provider({Key key, Widget child})
      : bloc = Feat_List_Bloc(),
        super(key: key, child: child);
  @override
  bool updateShouldNotify(_) => true;

  static Feat_List_Bloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Feat_List_Provider>())
        .bloc;
  }
}
