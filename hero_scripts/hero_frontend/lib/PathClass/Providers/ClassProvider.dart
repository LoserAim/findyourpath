import 'package:flutter/material.dart';
import 'package:hero_frontend/PathClass/Blocs/ClassBloc.dart';
export 'package:hero_frontend/PathClass/Blocs/ClassBloc.dart';

class ClassProvider extends InheritedWidget {
  final ClassBloc bloc;

  ClassProvider({Key key, Widget child})
      : bloc = ClassBloc(),
        super(key: key, child: child);
  @override
  bool updateShouldNotify(_) => true;

  static ClassBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ClassProvider>())
        .bloc;
  }
}
