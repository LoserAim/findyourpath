import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        enabled: true,
        child: Card(
            elevation: 8.0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  title: buildContainer(),
                  subtitle: buildContainer(),
                )));
    //     Card(

    //       child: Shimmer.fromColors(
    //           baseColor: Colors.grey[300],
    //           highlightColor: Colors.grey[100],
    //           child: Container(
    //           padding: EdgeInsets.symmetric(vertical:5.0, horizontal: 5.0),
    //           height: 48.0,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: <Widget>[
    //               buildContainer(),
    //               buildContainer(),
    //             ],
    //           ),
    //         ),
    //       ),
    //     );
  }

  Widget buildContainer() {
    return Container(
        color: Colors.white,
        height: 8,
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 1.0,
          bottom: 1.0,
        ));
  }
}
