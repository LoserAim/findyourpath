import 'dart:async';
import 'dart:convert';

import 'package:hero_frontend/Models/FeatModel.dart';
import 'package:hero_frontend/Models/PathClassModel.dart';
import 'package:hero_frontend/Services/apihandler.dart';
import 'package:rxdart/rxdart.dart';

class Class_Bloc extends Object with Validators {
  final _topIds = PublishSubject<List<int>>();
  final _itemsOutput = BehaviorSubject<Map<int, Future<Path_Class>>>();
  final _itemsFetcher = PublishSubject<int>();
  final _pathClass = BehaviorSubject<Path_Class>();
  final _chosenArchetype = BehaviorSubject<Archetype>();
  final _chosenFeats = BehaviorSubject<List<Feat>>();
  final _classFeatures = BehaviorSubject<List<Feat>>();
  final _proficiencies = BehaviorSubject<List<Proficiency>>();

  Function(List<Feat>) get changeClassFeatures => _classFeatures.sink.add;
  Function(List<Feat>) get changeChosenFeats => _chosenFeats.sink.add;
  Function(List<Proficiency>) get changeProficiencies => _proficiencies.sink.add;
  Function(Archetype) get changeChosenArchetypes => _chosenArchetype.sink.add;
  Function(Path_Class) get changePathClass => _pathClass.sink.add;
  
  // SECTION Id stream
  Observable<List<int>> get topIds => _topIds.stream;
  Observable<Map<int, Future<Path_Class>>> get items => _itemsOutput.stream;
  Function(int) get fetchItem => _itemsFetcher.sink.add;


  Stream<List<Feat>> get classFeatures => _classFeatures.stream.transform(validateClassFeatures);
  Stream<List<Feat>> get chosenFeats => _chosenFeats.stream.transform(validateClassFeatures);
  List<Feat> get returnChosenFeats => _chosenFeats.stream.value;
  Path_Class get returnPathClass => _pathClass.stream.value;
  Archetype get returnChosenArchetype => _chosenArchetype.stream.value;
  Stream<Path_Class> get pathClass => _pathClass.stream.transform(validatePathClass);
  Stream<Archetype> get chosenArchetypes =>_chosenArchetype.stream.transform(validateChosenArchetypes);
  // Stream<List<Archetype>> get archetypes =>
  //     _archetypes.stream.transform(validateArchetypes);
  Stream<List<Proficiency>> get proficiencies =>
      _proficiencies.stream.transform(validateProficiencies);
  //STUB Constructor
  Class_Bloc() {
    _itemsFetcher.stream.transform(_itemsTransformer()).pipe(_itemsOutput);
  }

  Future<Path_Class> getClassById(int id) async {
    return APIservice.getClassById(id).then((responseBody) {
      var res = jsonDecode(responseBody);
      return Path_Class.fromMappedJson(res);
    });
  }






  fetchData(int id) async {
    final Path_Class item = await getClassById(id);
    changePathClass(item);
  }

  fetchTopIds() async {
    List<int> ids = [];
    APIservice.getClassListIds().then((responseBody) {
      List<dynamic> data = jsonDecode(responseBody);
      data.forEach((value) {
        ids.add(value['id']);
      });
      _topIds.sink.add(ids);
    });
  }

  _itemsTransformer() {
    return ScanStreamTransformer(
        (Map<int, Future<Path_Class>> cache, int id, index) {
      cache[id] = getClassById(id);
      return cache;
    }, <int, Future<Path_Class>>{});
  }

  dispose() {
    _topIds.close();
    _itemsFetcher.close();
    _itemsOutput.close();
    _pathClass.close();
    _chosenArchetype.close();
    _proficiencies.close();
    _classFeatures.close();
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
  final validateClassFeatures =
      StreamTransformer<List<Feat>, List<Feat>>.fromHandlers(
          handleData: (item, sink) {
    if (item == null) {
      sink.addError('item cannot be null!');
    } else {
      sink.add(item);
    }
  });
  final validateProficiencies =
      StreamTransformer<List<Proficiency>, List<Proficiency>>.fromHandlers(
          handleData: (item, sink) {
    if (item == null) {
      sink.addError('item cannot be null!');
    } else {
      sink.add(item);
    }
  });
  final validateArchetypes =
      StreamTransformer<List<Archetype>, List<Archetype>>.fromHandlers(
          handleData: (item, sink) {
    if (item == null) {
      sink.addError('item cannot be null!');
    } else {
      sink.add(item);
    }
  });
  final validateChosenArchetypes =
      StreamTransformer<Archetype, Archetype>.fromHandlers(
          handleData: (item, sink) {
    if (item == null) {
      sink.addError('item cannot be null!');
    } else {
      sink.add(item);
    }
  });
}
