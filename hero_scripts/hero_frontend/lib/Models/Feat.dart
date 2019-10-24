class Feat{
  int id;
  String title;
  String description;
  int level;

  Feat(this.id,this.title,this.description,this.level);
  Feat.fromMappedJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        level = json['level'];

  Map<String, dynamic> toJson() =>
    {
      'id': id,
      'title': title,
      'description': description,
      'level': level,
    };
}