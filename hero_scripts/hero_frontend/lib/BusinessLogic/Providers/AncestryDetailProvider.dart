import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Blocs/AncestryDetailBloc.dart';
export 'package:hero_frontend/BusinessLogic/Blocs/AncestryDetailBloc.dart';

class Ancestry_Detail_Provider extends InheritedWidget {
  final Ancestry_Detail_Bloc bloc;

  Ancestry_Detail_Provider({Key key, Widget child})
      : bloc = Ancestry_Detail_Bloc(),
        super(key: key, child: child);
  @override
  bool updateShouldNotify(_) => true;

  static Ancestry_Detail_Bloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Ancestry_Detail_Provider>())
        .bloc;
  }
}
