import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Blocs/ClassBloc.dart';
export 'package:hero_frontend/BusinessLogic/Blocs/ClassBloc.dart';

class ClassProvider extends InheritedWidget {
  final Class_Bloc bloc;

  ClassProvider({Key key, Widget child})
      : bloc = Class_Bloc(),
        super(key: key, child: child);
  @override
  bool updateShouldNotify(_) => true;

  static Class_Bloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ClassProvider>())
        .bloc;
  }
}
