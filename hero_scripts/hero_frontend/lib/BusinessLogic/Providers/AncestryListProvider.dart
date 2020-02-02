import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Blocs/AncestryListBloc.dart';
export 'package:hero_frontend/BusinessLogic/Blocs/AncestryListBloc.dart';

class Ancestry_List_Provider extends InheritedWidget {
  final Ancestry_List_Bloc bloc;

  Ancestry_List_Provider({Key key, Widget child})
      : bloc = Ancestry_List_Bloc(),
        super(key: key, child: child);
  @override
  bool updateShouldNotify(_) => true;

  static Ancestry_List_Bloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Ancestry_List_Provider>())
        .bloc;
  }
}
