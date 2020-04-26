import 'package:flutter/material.dart';
import 'package:hero_frontend/Character/Blocs/CharacterBloc.dart';
export 'package:hero_frontend/Character/Blocs/CharacterBloc.dart';

class CharacterProvider extends InheritedWidget {
  final CharacterBloc bloc;

  CharacterProvider({Key key, Widget child})
      : bloc = CharacterBloc(),
        super(key: key, child: child);
  @override
  bool updateShouldNotify(_) => true;

  static CharacterBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<CharacterProvider>())
        .bloc;
  }
}
