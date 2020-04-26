import 'package:flutter/material.dart';
import 'package:hero_frontend/Ancestry/Providers/AncestryListProvider.dart';

class RefreshWidget extends StatelessWidget {
  final Widget child;

  RefreshWidget({this.child});

  @override
  Widget build(BuildContext context) {
    final bloc = AncestryListProvider.of(context);
    return RefreshIndicator(
      child: child, 
      onRefresh: () async {
        await bloc.fetchTopIds();
      },
      
    );
  }
}