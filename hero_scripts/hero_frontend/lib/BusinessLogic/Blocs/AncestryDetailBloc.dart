import 'dart:async';
import 'dart:convert';


import 'package:hero_frontend/Models/AncestryModel.dart';
import 'package:hero_frontend/Models/FeatModel.dart';
import 'package:hero_frontend/Services/apihandler.dart';
import 'package:rxdart/rxdart.dart';

class Ancestry_Detail_Bloc extends Object with Validators{

  final _id                 = BehaviorSubject<int>();
  final _hitPoints          = BehaviorSubject<int>();
  final _speed              = BehaviorSubject<int>();
  final _size               = BehaviorSubject<String>();
  final _name               = BehaviorSubject<String>();
  final _abilityBoosts      = BehaviorSubject<List<String>>();
  final _abilityFlaws       = BehaviorSubject<List<String>>();
  final _languages          = BehaviorSubject<List<String>>();
  final _traits             = BehaviorSubject<List<String>>();
  final _specialAbilities   = BehaviorSubject<List<String>>();
  final _heritages          = BehaviorSubject<List<Heritage>>();
  final _chosenHeritage    = BehaviorSubject<Heritage>();
  final _feats              = BehaviorSubject<List<Feat>>();
  final _book               = BehaviorSubject<String>();
  final _pgnum              = BehaviorSubject<int>();
  final _ancestry           = BehaviorSubject<Ancestry>();
  final _traitsOptions      = BehaviorSubject<List<String>>();
  final _specialAbilitiesOptions = BehaviorSubject<List<String>>();
  final _freeBoosts = BehaviorSubject<int>();
  final _chosenFreeBoosts      = BehaviorSubject<List<String>>();

  List<String> get returnChosenAbilityBoosts => _chosenFreeBoosts.stream.value;
  List<String> get returnCurrentAbilityBoosts => _abilityBoosts.stream.value;
  Heritage get returnCurrentHeritage => _chosenHeritage.stream.value;
  Ancestry get returnCurrentAncestry => _ancestry.stream.value;
  Function(List<String>)    get changeTraitsOptions => _traitsOptions.sink.add;
  Function(List<String>)    get changeSpecialAbilitiesOptions => _specialAbilitiesOptions.sink.add;
  Function(int)             get changeHitPoints => _hitPoints.sink.add;
  Function(int)             get changeSpeed => _speed.sink.add;
  Function(String)          get changeSize => _size.sink.add;
  Function(String)          get changeName => _name.sink.add;
  Function(List<String>)    get changeAbilityBoosts => _abilityBoosts.sink.add;
  Function(List<String>)    get changeAbilityFlaws => _abilityFlaws.sink.add;
  Function(List<String>)    get changeLanguages => _languages.sink.add;
  Function(List<String>)    get changeTraits => _traits.sink.add;
  Function(List<String>)    get changeSpecialAbilities => _specialAbilities.sink.add;
  Function(List<Heritage>)  get changeHeritages => _heritages.sink.add;
  Function(Heritage)        get changeChosenHeritage => _chosenHeritage.sink.add;
  Function(List<Feat>)      get changeFeats => _feats.sink.add;
  Function(Ancestry)        get changeAncestry => _ancestry.sink.add;
  Function(String)          get changBook => _book.sink.add;
  Function(int)             get changePgnum => _pgnum.sink.add;
  Function(int)             get changeFreeBoosts => _freeBoosts.sink.add;
  Function(List<String>)    get changeChosenFreeBoosts => _chosenFreeBoosts.sink.add;
  


  Stream<int> get hitPoints => _hitPoints.stream.transform(validateHitPoints);
  Stream<String> get size => _size.stream.transform(validateSize);
  Stream<String> get name => _name.stream.transform(validateName);
  Stream<List<String>> get abilityBoosts => _abilityBoosts.stream.transform(validateAbilityBoosts);
  Stream<List<String>> get abilityFlaws => _abilityFlaws.stream.transform(validateAbilityFlaws);
  Stream<List<String>> get languages => _languages.stream.transform(validateLanguages);
  Stream<List<String>> get traits => _traits.stream.transform(validateTraits);
  Stream<List<String>> get specialAbilities => _specialAbilities.stream.transform(validateSpecialAbilities);
  Stream<List<Heritage>> get heritages => _heritages.stream.transform(validateHeritages);
  Stream<Heritage> get chosenHeritage => _chosenHeritage.stream.transform(validateHeritage);
  Stream<List<Feat>> get feats => _feats.stream.transform(validateFeats);
  Stream<Ancestry> get ancestry => _ancestry.stream.transform(validateAncestry);
  Stream<List<String>> get traitsOptions => _traitsOptions.stream.transform(validateSpecialAbilities);
  Stream<List<String>> get specialAbilitiesOptions => _specialAbilitiesOptions.stream.transform(validateSpecialAbilities);
  Stream<int> get freeBoosts => _freeBoosts.stream.transform(validateHitPoints);
  Stream<List<String>> get chosenFreeBoosts => _chosenFreeBoosts.stream.transform(validateAbilityBoosts);
  
  Future<Ancestry> getAncestryById(int id) async {
    return APIservice.getAncestryById(id).then((responseBody) {
      var res = jsonDecode(responseBody);
      return Ancestry.fromMappedJson(res);
    });
  }

  Future<List<String>> getTraitsNamesList() async {
    return APIservice.getTraitsNamesList().then((responseBody) {
    var res = jsonDecode(responseBody);
    List<String> temp = List();
    res.forEach( (item) => temp.add(item['name']));
    return temp;
    });
  }

  Future<List<String>> getSpecialAbilitiesOptionsList() async {
    return APIservice.getSpecialAbilitiesList().then((responseBody) {
    var res = jsonDecode(responseBody);
    List<String> temp = List();
    res.forEach( (item) => temp.add(item['name']));
    return temp;
    });
  }

  fetchData(int id) async
  {
    final Ancestry item = await getAncestryById(id);
    final List<String> traits = await getTraitsNamesList();
    final List<String> specials = await getSpecialAbilitiesOptionsList();
    final Heritage heritagChoice = Heritage();
    changeHitPoints(item.hit_points);
    changeSize(item.size);
    changeName(item.name);
    changeAbilityBoosts(item.ability_boosts);
    changeAbilityFlaws(item.ability_flaws);
    changeLanguages(item.languages);
    changeTraits(item.traits);
    changeSpecialAbilities(item.special_abilities);
    changeHeritages(item.heritages);
    changeFeats(item.feats);
    changeAncestry(item);
    changBook(item.book);
    changePgnum(item.pgnum);
    changeTraitsOptions(traits);
    changeSpecialAbilitiesOptions(specials);
    changeChosenHeritage(heritagChoice);
    changeFreeBoosts(item.free_boosts);
    changeChosenFreeBoosts(List<String>());
  }

  dispose() {
    _id.close();
    _hitPoints.close();
    _size.close();
    _name.close();
    _abilityBoosts.close();
    _abilityFlaws.close();
    _languages.close();
    _traits.close();
    _specialAbilities.close();
    _heritages.close();
    _chosenHeritage.close();
    _feats.close();
    _book.close();
    _pgnum.close();
    _ancestry.close();
    _specialAbilitiesOptions.close();
    _traitsOptions.close();
    _speed.close();
    _chosenFreeBoosts.close();
    _freeBoosts.close();
  }
}

class Validators {
  final validateHitPoints = StreamTransformer<int, int>.fromHandlers(
    handleData: (hitpoints, sink) {
      if(hitpoints == 0 || hitpoints == null)
      {
        sink.add(0);
      }
      else{
        sink.add(hitpoints);
      }
    });
  final validateAncestry = StreamTransformer<Ancestry, Ancestry>.fromHandlers(
    handleData: (ancestry, sink) {
      if(ancestry == null)
      {
        sink.addError('ancestry cannot be null!');
      }
      else{
        sink.add(ancestry);
      }
    });
    final validateHeritage = StreamTransformer<Heritage, Heritage>.fromHandlers(
    handleData: (item, sink) {
      if(item == null)
      {
        sink.addError('item cannot be null!');
      }
      else{
        sink.add(item);
      }
    });
  final validateSize = StreamTransformer<String, String>.fromHandlers(
    handleData: (size, sink) {
      if(size.length <= 0)
      {
        sink.addError("Size cannot be blank!");
      }
      else {
        sink.add(size);
      }
    });
  final validateName = StreamTransformer<String, String>.fromHandlers(
    handleData: (name, sink) {
      if(name.length <= 0)
      {
        sink.addError("Name cannot be blank!");
      }
      else {
        sink.add(name);
      }
    });
  final validateAbilityBoosts = StreamTransformer<List<String>, List<String>>.fromHandlers(
    handleData: (abilityBoosts, sink) {
      if(abilityBoosts.length <= 0)
      {
        sink.addError("Ability Boosts cannot be blank!");
      }
      else {
        sink.add(abilityBoosts);
      }
    }
  );
  final validateAbilityFlaws = StreamTransformer<List<String>, List<String>>.fromHandlers(
    handleData: (abilityFlaws, sink) {
      if(abilityFlaws.length <= 0)
      {
        sink.addError("Ability Flaws cannot be blank!");
      }
      else {
        sink.add(abilityFlaws);
      }
    }
  );
  final validateLanguages = StreamTransformer<List<String>, List<String>>.fromHandlers(
    handleData: (languages, sink) {
      if(languages.length <= 0)
      {
        sink.addError("Languages cannot be blank!");
      }
      else {
        sink.add(languages);
      }
    }
  );
  final validateTraits = StreamTransformer<List<String>, List<String>>.fromHandlers(
    handleData: (traits, sink) {
      if(traits.length <= 0)
      {
        sink.addError("Traits cannot be blank!");
      }
      else {
        sink.add(traits);
      }
    }
  );
  final validateSpecialAbilities = StreamTransformer<List<String>, List<String>>.fromHandlers(
    handleData: (specialAbilities, sink) {
      if(specialAbilities.length <= 0)
      {
        sink.addError("Special Abilities cannot be blank!");
      }
      else {
        sink.add(specialAbilities);
      }
    }
  );
  final validateHeritages = StreamTransformer<List<Heritage>, List<Heritage>>.fromHandlers(
    handleData: (heritages, sink) {
      sink.add(heritages);
    }
  );
  final validateFeats = StreamTransformer<List<Feat>, List<Feat>>.fromHandlers(
    handleData: (feats, sink) {
      if(feats.length <= 0)
      {
        sink.addError("Feats cannot be blank!");
      }
      else {
        sink.add(feats);
      }
    }
  );

}
