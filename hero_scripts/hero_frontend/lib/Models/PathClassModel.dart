class Path_Class {
  int id;
  int hit_points;
  String name;
  String key_ability;
  List<int> proficiencies;
  List<int> archetypes;
  List<int> features;
  int additional_skills;
  List<int> class_feats;
  int pgnum;
  String book;
  Path_Class(this.id, this.name, this.key_ability, this.proficiencies, this.archetypes, this.features, this.additional_skills, this.class_feats, this.pgnum, this.book);

  Path_Class.fromMappedJson(Map<String, dynamic> json)
      : id = json['id'],
        hit_points = json['hit_points'],
        name = json['name'],
        key_ability = json['key_ability'],
        proficiencies = json['proficiencies'].cast<int>(),
        archetypes = json['archetypes'].cast<int>(),
        features = json['features'].cast<int>(),
        additional_skills = json['additional_skills'],
        class_feats = json['class_feats'].cast<int>(),
        pgnum = json['pgnum'],
        book = json['book'];

  Map<String, dynamic> toJson() =>
    {
      'id' : id,
      'hit_points' : hit_points,
      'name' : name,
      'key_ability' : key_ability,
      'proficiencies' : proficiencies,
      'archetypes' : archetypes,
      'features' : features,
      'additional_skills' : additional_skills,
      'class_feats' : class_feats,
      'pgnum' : pgnum,
      'book' : book,
    };
}