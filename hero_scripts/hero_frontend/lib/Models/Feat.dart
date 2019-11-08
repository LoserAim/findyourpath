class Feat{
  int id;
  String title;
  String description;
  int level;
  int pgnum;
  String book;
  bool selected;

  Feat(this.id,this.title,this.description,this.level, this.pgnum, this.book, {this.selected=false});
  Feat.fromMappedJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        level = json['level'],
        pgnum = json['pgnum'],
        book = json['book'],
        selected =false;

  Map<String, dynamic> toJson() =>
    {
      'id': id,
      'title': title,
      'description': description,
      'level': level,
      'pgnum': pgnum,
      'book' :book,
    };
}