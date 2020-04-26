import 'package:flutter/material.dart';
import 'package:hero_frontend/Ancestry/Blocs/AncestryDetailBloc.dart';
export 'package:hero_frontend/Ancestry/Blocs/AncestryDetailBloc.dart';

class AncestryDetailProvider extends InheritedWidget {
  final AncestryDetailBloc bloc;

  AncestryDetailProvider({Key key, Widget child})
      : bloc = AncestryDetailBloc(),
        super(key: key, child: child);
  @override
  bool updateShouldNotify(_) => true;

  static AncestryDetailBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<AncestryDetailProvider>())
        .bloc;
  }
}
