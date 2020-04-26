import 'package:flutter/material.dart';
import 'package:hero_frontend/Feat/Blocs/FeatBloc.dart';
export 'package:hero_frontend/Feat/Blocs/FeatBloc.dart';

class FeatProvider extends InheritedWidget {
  final FeatBloc bloc;

  FeatProvider({Key key, Widget child})
      : bloc = FeatBloc(),
        super(key: key, child: child);
  @override
  bool updateShouldNotify(_) => true;

  static FeatBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<FeatProvider>())
        .bloc;
  }
}
