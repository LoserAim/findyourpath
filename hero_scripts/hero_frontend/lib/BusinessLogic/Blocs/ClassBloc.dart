

import 'dart:async';
import 'dart:convert';

import 'package:hero_frontend/Models/PathClassModel.dart';
import 'package:hero_frontend/Services/apihandler.dart';
import 'package:rxdart/rxdart.dart';

class Class_Bloc extends Object with Validators{
  final _topIds = PublishSubject<List<int>>();
  final _itemsOutput = BehaviorSubject<Map<int, Future<Path_Class>>>();
  final _itemsFetcher = PublishSubject<int>();
  final _pathClass    =BehaviorSubject<Path_Class>();



  Function(Path_Class)        get changePathClass => _pathClass.sink.add;
  Observable<List<int>> get topIds => _topIds.stream;
  Observable<Map<int, Future<Path_Class>>> get items => _itemsOutput.stream;

  Function(int) get fetchItem => _itemsFetcher.sink.add;
  Stream<Path_Class> get pathClass => _pathClass.stream.transform(validatePathClass);

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
  fetchData(int id) async
  {
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
      },
      <int, Future<Path_Class>>{}
    );
  }

  dispose() {
    _topIds.close();
    _itemsFetcher.close();
    _itemsOutput.close();
    _pathClass.close();
  }
}

class Validators {

  final validatePathClass = StreamTransformer<Path_Class, Path_Class>.fromHandlers(
    handleData: (item, sink) {
      if(item == null)
      {
        sink.addError('item cannot be null!');
      }
      else{
        sink.add(item);
      }
    });

}
