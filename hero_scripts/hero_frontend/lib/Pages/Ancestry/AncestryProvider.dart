import 'package:flutter/material.dart';
import 'package:hero_frontend/Pages/Ancestry/AncestryBloc.dart';
export 'package:hero_frontend/Pages/Ancestry/AncestryBloc.dart';

class Ancestry_Provider extends InheritedWidget {
  final Ancestry_Bloc bloc;

  Ancestry_Provider({Key key, Widget child})
      : bloc = Ancestry_Bloc(),
        super(key: key, child: child);
  @override
  bool updateShouldNotify(_) => true;

  static Ancestry_Bloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Ancestry_Provider)
            as Ancestry_Provider)
        .bloc;
  }
}
