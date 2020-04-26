import 'dart:async';
import 'dart:convert';
import 'package:hero_frontend/Ancestry/Models/Ancestry.dart';
import 'package:hero_frontend/Ancestry/Models/Heritage.dart';
import 'package:hero_frontend/Character/Models/Character.dart';
import 'package:hero_frontend/Feat/Models/Feat.dart';
import 'package:hero_frontend/PathClass/Models/PathClass.dart';
import 'package:hero_frontend/Services/apihandler.dart';
import 'package:rxdart/rxdart.dart';

class CharacterBloc extends Object with Validators {
  //SECTION To Display list
  final _topIds = PublishSubject<List<int>>();
  final _itemsOutput = BehaviorSubject<Map<int, Future<Character>>>();
  final _itemsFetcher = PublishSubject<int>();

  Map<int, Future<Character>> get currentlist => _itemsOutput.stream.value;
  Observable<List<int>> get topIds => _topIds.stream;
  Observable<Map<int, Future<Character>>> get items => _itemsOutput.stream;

  Function(int) get fetchItem => _itemsFetcher.sink.add;

  CharacterBloc() {
    _itemsFetcher.stream.transform(_itemsTransformer()).pipe(_itemsOutput);
  }

  fetchTopIds() async {
    List<int> ids = [];
    APIservice.getCharacterListIds().then((responseBody) {
      List<dynamic> data = jsonDecode(responseBody);
      data.forEach((value) {
        ids.add(value['id']);
      });
      _topIds.sink.add(ids);
    });
  }

  Future<Character> getCharacterByIdFull(int id) async {
    return APIservice.getCharacterByIdFull(id).then((responseBody) {
      var res = jsonDecode(responseBody);
      return Character.fromMappedJson(res);
    });
  }

  _itemsTransformer() {
    return ScanStreamTransformer(
        (Map<int, Future<Character>> cache, int id, index) {
      cache[id] = getCharacterByIdFull(id);
      return cache;
    }, <int, Future<Character>>{});
  }

  //SECTION Start of Data collection
  final _folderPath = BehaviorSubject<String>();
  final _chosenABoosts = BehaviorSubject<List<String>>();
  final _chosenAFlaws = BehaviorSubject<List<String>>();
  final _chosenBBoosts = BehaviorSubject<List<String>>();
  final _chosenCBoosts = BehaviorSubject<List<String>>();
  final _chosenPBoosts = BehaviorSubject<List<String>>();
  final _chosenAncestryFeats = BehaviorSubject<List<Feat>>();
  final _chosenAncestry = BehaviorSubject<Ancestry>();
  final _chosenHeritage = BehaviorSubject<Heritage>();
  final _chosenArchetype = BehaviorSubject<Archetype>();
  final _chosenClassFeats = BehaviorSubject<List<Feat>>();
  final _chosenClass = BehaviorSubject<PathClass>();
  final _name = BehaviorSubject<String>();
  final _deity = BehaviorSubject<String>();
  final _alignment = BehaviorSubject<String>();
  final _playerName = BehaviorSubject<String>();

  String get returnFolderPath => _folderPath.stream.value;
  String get returnName => _name.stream.value;
  String get returnDeity => _deity.stream.value;
  String get returnPlayerName => _playerName.stream.value;
  String get returnAlignment => _alignment.stream.value;
  List<String> get returnCurrentAFlaws => _chosenAFlaws.stream.value;
  List<String> get returnCurrentABoosts => _chosenABoosts.stream.value;
  List<String> get returnCurrentBBoosts => _chosenBBoosts.stream.value;
  List<String> get returnCurrentCBoosts => _chosenCBoosts.stream.value;
  List<String> get returnCurrentPBoosts => _chosenPBoosts.stream.value;
  List<Feat> get returnCurrentAncestryFeats => _chosenAncestryFeats.stream.value;
  Ancestry get returnCurrentAncestry => _chosenAncestry.stream.value;
  Heritage get returnCurrentHeritage => _chosenHeritage.stream.value;
  Archetype get returnCurrentArchetype => _chosenArchetype.stream.value;
  List<Feat> get returnCurrentClassFeats => _chosenClassFeats.stream.value;
  PathClass get returnCurrentClass => _chosenClass.stream.value;

  Function(List<String>) get changeChosenABoosts => _chosenABoosts.sink.add;
  Function(List<String>) get changeChosenBBoosts => _chosenBBoosts.sink.add;
  Function(List<String>) get changeChosenCBoosts => _chosenCBoosts.sink.add;
  Function(List<String>) get changeChosenPBoosts => _chosenPBoosts.sink.add;
  Function(List<String>) get changeChosenAFlaws => _chosenAFlaws.sink.add;
  Function(List<Feat>) get changeChosenAncestryFeats => _chosenAncestryFeats.sink.add;
  Function(Ancestry) get changeChosenAncestry => _chosenAncestry.sink.add;
  Function(Heritage) get changeChosenHeritage => _chosenHeritage.sink.add;
  Function(Archetype) get changeChosenArchetype => _chosenArchetype.sink.add;
  Function(List<Feat>) get changeChosenClassFeats => _chosenClassFeats.sink.add;
  Function(PathClass) get changeChosenClass => _chosenClass.sink.add;
  Function(String) get changeName => _name.sink.add;
  Function(String) get changeDeity => _deity.sink.add;
  Function(String) get changePlayerName => _playerName.sink.add;
  Function(String) get changeAlignment => _alignment.sink.add;
  Function(String) get changeFolderPath => _folderPath.sink.add;

  Stream<List<String>> get chosenAFlaws => _chosenAFlaws.stream.transform(validateGenericStrings);
  Stream<List<String>> get chosenABoosts => _chosenABoosts.stream.transform(validateGenericStrings);
  Stream<List<String>> get chosenBBoosts => _chosenBBoosts.stream.transform(validateGenericStrings);
  Stream<List<String>> get chosenCBoosts => _chosenCBoosts.stream.transform(validateGenericStrings);
  Stream<List<String>> get chosenPBoosts => _chosenPBoosts.stream.transform(validateGenericStrings);
  Stream<List<Feat>> get chosenAncestryFeats => _chosenAncestryFeats.stream.transform(validateFeats);
  Stream<Ancestry> get chosenAncestry => _chosenAncestry.stream.transform(validateAncestry);
  Stream<Heritage> get chosenHeritage => _chosenHeritage.stream.transform(validateHeritage);
  Stream<Archetype> get chosenArchetype => _chosenArchetype.stream.transform(validateArchetype);
  Stream<List<Feat>> get chosenClassFeats => _chosenClassFeats.stream.transform(validateFeats);
  Stream<PathClass> get chosenClass => _chosenClass.stream.transform(validatePathClass);
  Stream<String> get name => _name.stream.transform(validateGenericString);
  Stream<String> get deity => _deity.stream.transform(validateGenericString);
  Stream<String> get playerName => _playerName.stream.transform(validateGenericString);
  Stream<String> get alignment => _alignment.stream.transform(validateGenericString);
  Stream<String> get folderPath => _folderPath.stream.transform(validateGenericString);

  wipeCurrentData() {
    changeChosenABoosts(List<String>());
    changeChosenBBoosts(List<String>());
    changeChosenCBoosts(List<String>());
    changeChosenPBoosts(List<String>());
    changeChosenAFlaws(List<String>());
    changeChosenAncestryFeats(List<Feat>());
    changeChosenAncestry(Ancestry());
    changeChosenHeritage(Heritage());
    changeChosenArchetype(Archetype());
    changeChosenClassFeats(List<Feat>());
    changeChosenClass(PathClass());
    changeName("");
    changePlayerName("");
    changeDeity("");
    changeAlignment("");
  }

  dispose() {
    _chosenABoosts.close();
    _chosenBBoosts.close();
    _chosenCBoosts.close();
    _chosenPBoosts.close();
    _chosenAFlaws.close();
    _chosenAncestryFeats.close();
    _chosenAncestry.close();
    _chosenHeritage.close();
    _chosenArchetype.close();
    _chosenClassFeats.close();
    _chosenClass.close();
    _chosenBBoosts.close();
    _name.close();
    _playerName.close();
    _deity.close();
    _alignment.close();
    _topIds.close();
    _itemsOutput.close();
    _itemsFetcher.close();
  }
}

class Validators {
  final validatePathClass =
      StreamTransformer<PathClass, PathClass>.fromHandlers(
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
  final validateGenericString =
      StreamTransformer<String, String>.fromHandlers(handleData: (item, sink) {
    if (item == null) {
      sink.add('');
    } else {
      sink.add(item);
    }
  });
  final validateGenericInt =
      StreamTransformer<int, int>.fromHandlers(handleData: (item, sink) {
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
