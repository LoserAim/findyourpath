import 'dart:async';
import 'dart:convert';
import 'package:hero_frontend/Pages/Ancestry/AncestryModel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:hero_frontend/Services/apihandler.dart';

class Ancestry_Bloc {
  final _topIds = PublishSubject<List<int>>();
  final _itemsOutput = BehaviorSubject<Map<int, Future<Ancestry>>>();
  final _itemsFetcher = PublishSubject<int>();



  Observable<List<int>> get topIds => _topIds.stream;
  Observable<Map<int, Future<Ancestry>>> get items => _itemsOutput.stream;

  get fetchItem => _itemsFetcher.sink.add;


  //STUB Constructor
  Ancestry_Bloc() {
    _itemsFetcher.stream.transform(_itemsTransformer()).pipe(_itemsOutput);
  }



  Future<Ancestry> getAncestryById(int id) async {
    var data;
    APIservice.getAncestryById(id).then((responseBody) {
      var res = jsonDecode(responseBody);
      data = Ancestry.fromMappedJson(res);
    });
    return data;
  }

  fetchTopIds() async {
    List<int> ids = [];
    APIservice.getAncestryListIds().then((responseBody) {
      List<dynamic> data = jsonDecode(responseBody);
      data.forEach((value) {
        ids.add(value['id']);

      });
    });
    print(ids);
    _topIds.sink.add(ids);
  }

  _itemsTransformer() {
    return ScanStreamTransformer(
      (Map<int, Future<Ancestry>> cache, int id, index) {
        cache[id] = getAncestryById(id);
        return cache;
      },
      <int, Future<Ancestry>>{}
    );
  }

  dispose() {
    _topIds.close();
    _itemsFetcher.close();
    _itemsOutput.close();
  }
}

