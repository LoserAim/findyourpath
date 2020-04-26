import 'dart:async';
import 'dart:convert';

import 'package:hero_frontend/Feat/Models/Feat.dart';
import 'package:rxdart/rxdart.dart';
import 'package:hero_frontend/Services/apihandler.dart';

class FeatBloc extends Object with Validators {
  final _topIds = PublishSubject<List<int>>();
  final _itemsOutput = BehaviorSubject<Map<int, Future<Feat>>>();
  final _itemsFetcher = PublishSubject<int>();
  final _chosenFeats  = BehaviorSubject<List<Feat>>();



  Observable<List<int>> get topIds => _topIds.stream;
  Observable<Map<int, Future<Feat>>> get items => _itemsOutput.stream;
  List<Feat> get returnCurrentChosenFeats => _chosenFeats.stream.value;
  Function(List<Feat>) get changeChosenFeats => _chosenFeats.sink.add;
  Function(int) get fetchItem => _itemsFetcher.sink.add;

  Stream<List<Feat>> get chosenFeats => _chosenFeats.stream.transform(validateFeats);

  //STUB Constructor
  FeatBloc() {
    _itemsFetcher.stream.transform(_itemsTransformer()).pipe(_itemsOutput);
    changeChosenFeats(List<Feat>());
  }



  Future<Feat> getFeatById(int id) async {
    return APIservice.getFeatById(id).then((responseBody) {
      var res = jsonDecode(responseBody);
      return Feat.fromMappedJson(res);
    });
  }


  fetchTopIds() async {
    List<int> ids = [];
    APIservice.getFeatListIds().then((responseBody) {
      List<dynamic> data = jsonDecode(responseBody);
      data.forEach((value) {
        ids.add(value['id']);

      });
      _topIds.sink.add(ids);
    });
    
  }

  fetchClassFeatIds(int id) async {
    List<int> ids = [];
    APIservice.getClassFeatIds(id).then((responseBody) {
      List<dynamic> data = jsonDecode(responseBody);
      data.forEach((value) {
        ids.add(value['id']);

      });
      _topIds.sink.add(ids);
    });
    
  }
  fetchAncestryFeatIds(int id) async {
    List<int> ids = [];
    APIservice.getAncestryFeatIds(id).then((responseBody) {
      List<dynamic> data = jsonDecode(responseBody);
      data.forEach((value) {
        ids.add(value['id']);

      });
      _topIds.sink.add(ids);
    });
    
  }

  _itemsTransformer() {
    return ScanStreamTransformer(
      (Map<int, Future<Feat>> cache, int id, index) {
        cache[id] = getFeatById(id);
        return cache;
      },
      <int, Future<Feat>>{}
    );
  }

  dispose() {
    _topIds.close();
    _itemsFetcher.close();
    _itemsOutput.close();
    _chosenFeats.close();
  }
}

class Validators {
  final validateFeats =
      StreamTransformer<List<Feat>, List<Feat>>.fromHandlers(
          handleData: (item, sink) {
    if (item == null) {
      sink.addError('item cannot be null!');
    } else {
      sink.add(item);
    }
  });
}
