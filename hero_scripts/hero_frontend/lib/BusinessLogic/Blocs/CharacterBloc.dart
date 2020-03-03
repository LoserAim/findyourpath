import 'dart:async';

import 'package:hero_frontend/Models/AncestryModel.dart';
import 'package:hero_frontend/Models/FeatModel.dart';
import 'package:hero_frontend/Models/PathClassModel.dart';
import 'package:rxdart/rxdart.dart';

class Character_Bloc extends Object with Validators {
  final _chosenAbilityBoosts = BehaviorSubject<List<String>>();
  final _chosenAbilityFlaws = BehaviorSubject<List<String>>();
  final _chosenAncestryFeats = BehaviorSubject<List<Feat>>();
  final _chosenAncestry = BehaviorSubject<Ancestry>();
  final _chosenHeritage = BehaviorSubject<Heritage>();
  final _chosenArchetype = BehaviorSubject<Archetype>();
  final _chosenClassFeats = BehaviorSubject<List<Feat>>();
  final _chosenClass = BehaviorSubject<Path_Class>();

  List<String> get returnCurrentAbilityFlaws =>
      _chosenAbilityFlaws.stream.value;
  List<String> get returnCurrentAbilityBoosts =>
      _chosenAbilityBoosts.stream.value;
  List<Feat> get returnCurrentAncestryFeats =>
      _chosenAncestryFeats.stream.value;
  Ancestry get returnCurrentAncestry => 
      _chosenAncestry.stream.value;
  Heritage get returnCurrentHeritage => 
      _chosenHeritage.stream.value;
  Archetype get returnCurrentArchetype => 
      _chosenArchetype.stream.value;
  List<Feat> get returnCurrentClassFeats => 
      _chosenClassFeats.stream.value;
  Path_Class get returnCurrentClass => 
      _chosenClass.stream.value;

  Function(List<String>) get changeChosenAbilityBoosts => _chosenAbilityBoosts.sink.add;
  Function(List<String>) get changeChosenAbilityFlaws => _chosenAbilityFlaws.sink.add;
  Function(List<Feat>) get changeChosenAncestryFeats => _chosenAncestryFeats.sink.add;
  Function(Ancestry) get changeChosenAncestry => _chosenAncestry.sink.add;
  Function(Heritage) get changeChosenHeritage => _chosenHeritage.sink.add;
  Function(Archetype) get changeChosenArchetype => _chosenArchetype.sink.add;
  Function(List<Feat>) get changeChosenClassFeats => _chosenClassFeats.sink.add;
  Function(Path_Class) get changeChosenClass => _chosenClass.sink.add;

  Stream<List<String>> get chosenAbilityFlaws =>
      _chosenAbilityFlaws.stream.transform(validateGenericStrings);
  Stream<List<String>> get chosenAbilityBoosts =>
      _chosenAbilityBoosts.stream.transform(validateGenericStrings);
  Stream<List<Feat>> get chosenAncestryFeats =>
      _chosenAncestryFeats.stream.transform(validateFeats);
  Stream<Ancestry> get chosenAncestry =>
      _chosenAncestry.stream.transform(validateAncestry);
  Stream<Heritage> get chosenHeritage =>
      _chosenHeritage.stream.transform(validateHeritage);
  Stream<Archetype> get chosenArchetype =>
      _chosenArchetype.stream.transform(validateArchetype);
  Stream<List<Feat>> get chosenClassFeats =>
      _chosenClassFeats.stream.transform(validateFeats);
  Stream<Path_Class> get chosenClass =>
      _chosenClass.stream.transform(validatePathClass);

  wipeCurrentData() {
    changeChosenAbilityBoosts(null);
    changeChosenAbilityFlaws(null);
    changeChosenAncestryFeats(null);
    changeChosenAncestry(null);
    changeChosenHeritage(null);
    changeChosenArchetype(null);
    changeChosenClassFeats(null);
    changeChosenClass(null);
  }

  dispose() {
    _chosenAbilityBoosts.close();
    _chosenAbilityFlaws.close();
    _chosenAncestryFeats.close();
    _chosenAncestry.close();
    _chosenHeritage.close();
    _chosenArchetype.close();
    _chosenClassFeats.close();
    _chosenClass.close();
  }
}

class Validators {
  final validatePathClass =
      StreamTransformer<Path_Class, Path_Class>.fromHandlers(
          handleData: (item, sink) {
    if (item == null) {
      sink.addError('item cannot be null!');
    } else {
      sink.add(item);
    }
  });
  final validateGenericStrings =
      StreamTransformer<List<String>, List<String>>.fromHandlers(
          handleData: (item, sink) {
    if (item == null) {
      sink.addError('item cannot be null!');
    } else {
      sink.add(item);
    }
  });
  final validateFeats = StreamTransformer<List<Feat>, List<Feat>>.fromHandlers(
      handleData: (item, sink) {
    if (item == null) {
      sink.addError('item cannot be null!');
    } else {
      sink.add(item);
    }
  });
  final validateAncestry = StreamTransformer<Ancestry, Ancestry>.fromHandlers(
      handleData: (item, sink) {
    if (item == null) {
      sink.addError('item cannot be null!');
    } else {
      sink.add(item);
    }
  });
  final validateArchetype =
      StreamTransformer<Archetype, Archetype>.fromHandlers(
          handleData: (item, sink) {
    if (item == null) {
      sink.addError('item cannot be null!');
    } else {
      sink.add(item);
    }
  });
  final validateHeritage = StreamTransformer<Heritage, Heritage>.fromHandlers(
      handleData: (item, sink) {
    if (item == null) {
      sink.addError('item cannot be null!');
    } else {
      sink.add(item);
    }
  });
}
