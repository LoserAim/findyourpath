import 'dart:convert';

import 'package:card_settings/card_settings.dart';
import 'package:card_settings/widgets/card_settings_panel.dart';
import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/AncestryDetailProvider.dart';
import 'package:hero_frontend/Models/AncestryModel.dart';
import 'package:hero_frontend/Services/apihandler.dart';
import 'package:hero_frontend/Widgets/Ancestry/HeritageCardWidget.dart';
import 'package:hero_frontend/Widgets/Generics/GenericCardWidget.dart';
import 'package:hero_frontend/Widgets/Generics/LoadingContainerWidget.dart';

class Ancestry_Detail_Widget extends StatelessWidget {
  final Map<String, String> _sizeDict = {
    "T": "Tiny",
    "S": "Small",
    "M": "Medium",
    "L": "Large",
    "H": "Huge"
  };
  final List<String> _sizeOptions = [
    "Tiny",
    "Small",
    "Medium",
    "Large",
    "Huge"
  ];
  final List<String> _languageOptions = [
    "Kelish",
    "Mwangi",
    "Osiriani",
    "Shoanti",
    "Skald",
    "Tien",
    "Varisian",
    "Vudrani",
    "Common",
    "Dwarven",
    "Elven",
    "Gnomish",
    "Sylvan",
    "Goblin",
    "Halfing",
  ];
  final List<String> _abilities = [
    "Strength",
    "Dexterity",
    "Constitution",
    "Intelligence",
    "Wisdom",
    "Charisma"
  ];
  @override
  Widget build(BuildContext context) {
    final bloc = Ancestry_Detail_Provider.of(context);
    return StreamBuilder(
        stream: bloc.ancestry,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Loading_Container_Widget();
          return CardSettings.sectioned(
            children: <CardSettingsSection>[
              CardSettingsSection(
                //labelAlign: TextAlign.left,

                //contentAlign: TextAlign.right,

                children: <Widget>[
                  CardSettingsHeader(label: "Stats"),
                  CardSettingsInt(
                    label: "Hit Points",
                    icon: Icon(Icons.favorite_border),
                    initialValue:
                        snapshot.hasData ? snapshot.data.hit_points : 0,
                    validator: (value) {
                      if (value == null || value == 0)
                        return "Hit points cannot be 0!";
                    },
                    unitLabel: "hp",
                    autovalidate: true,
                  ),
                  CardSettingsInt(
                    icon: Icon(Icons.directions_run),
                    label: "Speed",
                    initialValue: snapshot.data.speed,
                    unitLabel: "ft",
                  ),
                  StreamBuilder(
                      stream: bloc.freeBoosts,
                      builder: (context, snapshotCount) {
                        if (!snapshot.hasData)
                          return CircularProgressIndicator();
                        return CardSettingsField(
                          requiredIndicator: Icon(Icons.warning,
                          color: Theme.of(context).textTheme.display3.color),
                          icon: Icon(Icons.exposure_plus_2),
                          contentOnNewLine: true,
                          label: 'You have ' +
                              ((snapshotCount.data == null) ? 0.toString() : snapshotCount.data.toString()) +
                              ' Free ability boost(s)',
                          content: StreamBuilder(
                            stream: bloc.chosenFreeBoosts,
                            builder: (BuildContext context,
                                AsyncSnapshot<List<String>> snapshot) {
                              List<String> currAb = bloc.returnCurrentAbilityBoosts;
                              List<Widget> choices = List();
                              List<String> current = snapshot.data ?? List<String>();
                              currAb.forEach((item) {
                                if(!current.contains(item))
                                  current.add(item);
                              });
                              _abilities.forEach((item) {
                                choices.add(
                                  ChoiceChip(
                                    label: Text(item),
                                    selected: current.contains(item),
                                    onSelected: (selected) {
                                      if (current.contains(item) && !currAb.contains(item)) {
                                        current.remove(item);
                                        bloc.changeFreeBoosts(snapshotCount.data + 1);
                                      }
                                      else if ((snapshotCount.data ?? 0) > 0 && !currAb.contains(item) && !current.contains(item)) {
                                        current.add(item);
                                        bloc.changeFreeBoosts(snapshotCount.data - 1); 
                                      }
                                      bloc.changeChosenFreeBoosts(current);
                                    },
                                  ),
                                );
                              });

                              return Wrap(
                                children: choices,
                              );
                            },
                          ),
                        );
                      }),
                  CardSettingsField(
                    icon: Icon(Icons.exposure_neg_2),
                    contentOnNewLine: true,
                    label: "Ability Flaws",
                    content: StreamBuilder(
                      stream: bloc.abilityFlaws,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<String>> snapshot) {
                        if (!snapshot.hasData)
                          return CircularProgressIndicator();
                        List<Widget> choices = List();
                        List<String> current = snapshot.data;
                        _abilities.forEach((item) {
                          choices.add(
                            ChoiceChip(
                              label: Text(item),
                              selected: current.contains(item),
                              onSelected: (selected) => null,
                            ),
                          );
                        });

                        return Wrap(
                          children: choices,
                        );
                      },
                    ),
                  ),
                  CardSettingsListPicker(
                    icon: Icon(Icons.accessibility),
                    label: 'Size',
                    initialValue: _sizeDict[snapshot.data.size],
                    onChanged: bloc.changeSize,
                    options: _sizeOptions,
                  ),
                  CardSettingsField(
                    icon: Icon(Icons.record_voice_over),
                    contentOnNewLine: true,
                    label: "Languages",
                    content: StreamBuilder(
                      stream: bloc.languages,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<String>> snapshot) {
                        if (!snapshot.hasData)
                          return CircularProgressIndicator();
                        List<Widget> choices = List();
                        List<String> current = snapshot.data;
                        _languageOptions.forEach((item) {
                          choices.add(
                            ChoiceChip(
                              label: Text(item),
                              selected: current.contains(item),
                              onSelected: (selected) => null,
                            ),
                          );
                        });

                        return Wrap(
                          children: choices,
                        );
                      },
                    ),
                  ),
                  CardSettingsField(
                    icon: Icon(Icons.title),
                    contentOnNewLine: true,
                    label: "Traits",
                    content: StreamBuilder(
                      stream: bloc.traitsOptions,
                      builder: (BuildContext context,
                          AsyncSnapshot traitsOptionsSnapshot) {
                        if (!traitsOptionsSnapshot.hasData)
                          return CircularProgressIndicator();
                        return StreamBuilder(
                          stream: bloc.traits,
                          builder: (BuildContext context,
                              AsyncSnapshot<List<String>> snapshot) {
                            if (!snapshot.hasData)
                              return CircularProgressIndicator();
                            List<Widget> choices = List();
                            List<String> current = snapshot.data;

                            traitsOptionsSnapshot.data.forEach((item) {
                              choices.add(
                                ChoiceChip(
                                  label: Text(item),
                                  selected: current.contains(item),
                                  onSelected: (selected) => null,
                                ),
                              );
                            });

                            return Wrap(
                              children: choices,
                            );
                          },
                        );
                      },
                    ),
                  ),
                  CardSettingsField(
                    icon: Icon(Icons.vpn_key),
                    contentOnNewLine: true,
                    label: "Special Abilities",
                    content: StreamBuilder(
                      stream: bloc.specialAbilitiesOptions,
                      builder: (BuildContext context,
                          AsyncSnapshot specialOptionsSnapshot) {
                        if (!specialOptionsSnapshot.hasData)
                          return CircularProgressIndicator();
                        return StreamBuilder(
                          stream: bloc.specialAbilities,
                          builder: (BuildContext context,
                              AsyncSnapshot<List<String>> snapshot) {
                            if (!snapshot.hasData)
                              return CircularProgressIndicator();
                            List<Widget> choices = List();
                            List<String> current = snapshot.data;

                            specialOptionsSnapshot.data.forEach((item) {
                              choices.add(
                                ChoiceChip(
                                  label: Text(item),
                                  selected: current.contains(item),
                                  onSelected: (selected) => null,
                                ),
                              );
                            });

                            return Wrap(
                              children: choices,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
