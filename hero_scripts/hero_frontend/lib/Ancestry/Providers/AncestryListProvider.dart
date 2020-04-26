import 'package:flutter/material.dart';
import 'package:hero_frontend/Ancestry/Blocs/AncestryListBloc.dart';
export 'package:hero_frontend/Ancestry/Blocs/AncestryListBloc.dart';

class AncestryListProvider extends InheritedWidget {
  final AncestryListBloc bloc;

  AncestryListProvider({Key key, Widget child})
      : bloc = AncestryListBloc(),
        super(key: key, child: child);
  @override
  bool updateShouldNotify(_) => true;

  static AncestryListBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<AncestryListProvider>())
        .bloc;
  }
}
