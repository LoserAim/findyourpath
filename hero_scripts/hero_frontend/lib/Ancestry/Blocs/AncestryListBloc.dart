import 'dart:async';
import 'dart:convert';
import 'package:hero_frontend/Ancestry/Models/Ancestry.dart';
import 'package:rxdart/rxdart.dart';
import 'package:hero_frontend/Services/apihandler.dart';

class AncestryListBloc {
  final _topIds = PublishSubject<List<int>>();
  final _itemsOutput = BehaviorSubject<Map<int, Future<Ancestry>>>();
  final _itemsFetcher = PublishSubject<int>();

  Observable<List<int>> get topIds => _topIds.stream;
  Observable<Map<int, Future<Ancestry>>> get items => _itemsOutput.stream;

  Function(int) get fetchItem => _itemsFetcher.sink.add;

  //STUB Constructor
  AncestryListBloc() {
    _itemsFetcher.stream.transform(_itemsTransformer()).pipe(_itemsOutput);
  }

  Future<Ancestry> getAncestryById(int id) async {
    return APIservice.getAncestryById(id).then((responseBody) {
      var res = jsonDecode(responseBody);
      return Ancestry.fromMappedJson(res);
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
        (Map<int, Future<Ancestry>> cache, int id, index) {
      cache[id] = getAncestryById(id);
      return cache;
    }, <int, Future<Ancestry>>{});
  }

  dispose() {
    _topIds.close();
    _itemsFetcher.close();
    _itemsOutput.close();
  }
}
