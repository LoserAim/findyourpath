import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Blocs/CharacterBloc.dart';
export 'package:hero_frontend/BusinessLogic/Blocs/CharacterBloc.dart';

class Character_Provider extends InheritedWidget {
  final Character_Bloc bloc;

  Character_Provider({Key key, Widget child})
      : bloc = Character_Bloc(),
        super(key: key, child: child);
  @override
  bool updateShouldNotify(_) => true;

  static Character_Bloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Character_Provider>())
        .bloc;
  }
}
