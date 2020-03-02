import 'package:flutter/material.dart';

class MultiChip_Selection_Widget extends StatelessWidget {
  final item;
  final List<dynamic> current;
  final bloc;

  const MultiChip_Selection_Widget(
      {Key key, this.item, this.current, this.bloc})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(item),
      selected: current.contains(item),
      onSelected: (selected) {
        current.contains(item) ? current.remove(item) : current.add(item);
        bloc.changeAbilityBoosts(current);
      },
    );
  }
}


/*
BoxDecoration decoration = BoxDecoration();
                  print(chosenFeatSnapshot.data);
                  if (chosenFeatSnapshot.data.contains(itemSnapshot.data))
                    decoration = BoxDecoration(color: Colors.redAccent);
                  else
                    decoration = BoxDecoration(
                      border: Border.all(color: Colors.redAccent, width: 1.0),
                    );

                  return Container(
                    decoration: decoration,
                    child: ListTile(
                      onTap: () {
                        List<Feat> temp = List();
                        chosenFeatSnapshot.data.contains(itemSnapshot.data)
                            ? temp.remove(itemSnapshot.data)
                            : temp.add(itemSnapshot.data);
                        bloc.changeChosenFeats(temp);
                      },
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      title: Text(
                        "${itemSnapshot.data.level} ${itemSnapshot.data.name}",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Row(
                        children: <Widget>[
                          Expanded(
                              child: Text("${itemSnapshot.data.description}",
                                  style: TextStyle(color: Colors.black)))
                        ],
                      ),
                    ),
                  );
 */