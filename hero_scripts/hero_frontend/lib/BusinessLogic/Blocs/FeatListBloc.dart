import 'dart:async';
import 'dart:convert';

import 'package:hero_frontend/Models/FeatModel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:hero_frontend/Services/apihandler.dart';

class Feat_List_Bloc {
  final _topIds = PublishSubject<List<int>>();
  final _itemsOutput = BehaviorSubject<Map<int, Future<Feat>>>();
  final _itemsFetcher = PublishSubject<int>();



  Observable<List<int>> get topIds => _topIds.stream;
  Observable<Map<int, Future<Feat>>> get items => _itemsOutput.stream;

  Function(int) get fetchItem => _itemsFetcher.sink.add;


  //STUB Constructor
  Feat_List_Bloc() {
    _itemsFetcher.stream.transform(_itemsTransformer()).pipe(_itemsOutput);
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
  }
}
