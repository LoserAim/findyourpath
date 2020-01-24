import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/AncestryProvider.dart';

class Refresh_Widget extends StatelessWidget {
  final Widget child;

  Refresh_Widget({this.child});

  @override
  Widget build(BuildContext context) {
    final bloc = Ancestry_Provider.of(context);
    return RefreshIndicator(
      child: child, 
      onRefresh: () async {
        await bloc.fetchTopIds();
      },
      
    );
  }
}