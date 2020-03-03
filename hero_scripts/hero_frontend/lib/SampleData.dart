import 'package:hero_frontend/Models/AncestryModel.dart';
import 'package:hero_frontend/Models/FeatModel.dart';

class Sample_Data {
  static List<Ancestry> ancestryList = [
    Ancestry(
        1,
        10,
        'Dwarf',
        'Medium',
        20,
        ['STR', 'WIS', 'FREE'],
        ['CHA'],
        ['Dwarf', 'Common'],
        ['Dwarf', 'Humanoid'],
        ['Darkvision'],
        [
          Heritage(
            id:1,
            name:'Dwarven Heritage',
            description:'This is a temporary description',
            //true,
          )
        ],
        [
          Feat(
            1,
            'Temp Feat Title',
            'Temp Feat Description',
            1,
            999,
            'N/A',
            //true
          )
        ],
        'N/A',
        999),
    Ancestry(
        2,
        6,
        'Elf',
        'Medium',
        30,
        ['DEX', 'INT', 'FREE'],
        ['CON'],
        ['Common', 'Elven'],
        ['Elf', 'Humanoid'],
        ['Low-Light Vision'],
        [
          Heritage(
            id: 2,
            name: 'Elven Heritage',
            description: 'This is a temporary description',
            //true,
          )
        ],
        [
          Feat(
            2,
            'Temp Feat Title',
            'Temp Feat Description',
            1,
            999,
            'N/A',
            //true
          )
        ],
        'N/A',
        999)
  ];
}
