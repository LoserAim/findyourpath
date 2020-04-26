import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';
import 'package:hero_frontend/PathClass/Providers/ClassProvider.dart';


class ClassFeaturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = ClassProvider.of(context);
    return CardSettings(
      children: <Widget>[
        CardSettingsHeader(
          label: "Class Features",
        ),
        StreamBuilder(
          stream: bloc.pathClass,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData)
              return CircularProgressIndicator();
            else {
              List<Widget> features = List();
              snapshot.data.features.forEach((item) {
                if (item.level == 1) {
                  features.add(CardSettingsField(
                    label: item.name,
                    contentOnNewLine: true,
                    content: Text(item.description),
                  ));
                }
              });
              return Wrap(
                children: features,
              );
            }
          },
        ),
      ],
    );
  }
}
