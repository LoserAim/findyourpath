

import 'dart:convert';

import 'package:hero_frontend/Models/PathClassModel.dart';
import 'package:hero_frontend/Services/apihandler.dart';
import 'package:rxdart/rxdart.dart';

class Class_Bloc {
 final _topIds = PublishSubject<List<int>>();
  final _itemsOutput = BehaviorSubject<Map<int, Future<Path_Class>>>();
  final _itemsFetcher = PublishSubject<int>();



  Observable<List<int>> get topIds => _topIds.stream;
  Observable<Map<int, Future<Path_Class>>> get items => _itemsOutput.stream;

  Function(int) get fetchItem => _itemsFetcher.sink.add;


  //STUB Constructor
  Class_Bloc() {
    _itemsFetcher.stream.transform(_itemsTransformer()).pipe(_itemsOutput);
  }



  Future<Path_Class> getAncestryById(int id) async {
    return APIservice.getAncestryById(id).then((responseBody) {
      var res = jsonDecode(responseBody);
      return Path_Class.fromMappedJson(res);
    });
  }

  fetchTopIds() async {
    List<int> ids = [];
    APIservice.getAncestryListIds().then((responseBody) {
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
        cache[id] = getAncestryById(id);
        return cache;
      },
      <int, Future<Path_Class>>{}
    );
  }

  dispose() {
    _topIds.close();
    _itemsFetcher.close();
    _itemsOutput.close();
  }
}