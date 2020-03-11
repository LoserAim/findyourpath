import 'package:hero_frontend/Models/AncestryModel.dart';
import 'package:hero_frontend/Models/FeatModel.dart';
import 'package:pdf/widgets.dart';

class Sample_Data {

  _test() {
    final Document pdf = Document();
    pdf.addPage(MultiPage(build: (Context context) => <Widget>[
      Header()
    ]));
  }
  static List<Ancestry> ancestryList = [
    Ancestry(
        id: 1,
        hit_points: 10,
        name : 'Dwarf',
        size: 'Medium',
        speed: 20,
        ability_boosts: ['STR', 'WIS', 'FREE'],
        ability_flaws: ['CHA'],
        languages: ['Dwarf', 'Common'],
        traits: ['Dwarf', 'Humanoid'],
        special_abilities: ['Darkvision'],
        heritages: [
          Heritage(
            id:1,
            name:'Dwarven Heritage',
            description:'This is a temporary description',
            //true,
          )
        ],
        feats: [
          Feat(
            id: 1,
            name:'Temp Feat Title',
            description:'Temp Feat Description',
            level: 1,
            pgnum:999,
            book:'N/A',
            //true
          )
        ],
        book: 'N/A',
        pgnum: 999),
    Ancestry(
        id: 2,
        hit_points: 6,
        name: 'Elf',
        size: 'Medium',
        speed: 30,
        ability_boosts: ['DEX', 'INT', 'FREE'],
        ability_flaws: ['CON'],
        languages: ['Common', 'Elven'],
        traits: ['Elf', 'Humanoid'],
        special_abilities: ['Low-Light Vision'],
        heritages: [
          Heritage(
            id: 2,
            name: 'Elven Heritage',
            description: 'This is a temporary description',
            //true,
          )
        ],
        feats: [
          Feat(
            id: 1,
            name:'Temp Feat Title',
            description:'Temp Feat Description',
            level: 1,
            pgnum:999,
            book:'N/A',
            //true
          )
        ],
        book:'N/A',
        pgnum:999)
  ];
}
