import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Blocs/ClassBloc.dart';
export 'package:hero_frontend/BusinessLogic/Blocs/ClassBloc.dart';

class Class_Provider extends InheritedWidget {
  final Class_Bloc bloc;

  Class_Provider({Key key, Widget child})
      : bloc = Class_Bloc(),
        super(key: key, child: child);
  @override
  bool updateShouldNotify(_) => true;

  static Class_Bloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Class_Provider>())
        .bloc;
  }
}
