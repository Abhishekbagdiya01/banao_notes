class NoteModel {
  String? id;
  String? title;
  String? desc;
  String? dateTime;

  NoteModel({this.id, this.title, this.desc, this.dateTime});

  factory NoteModel.fromJson(Map<String, dynamic> map) {
    return NoteModel(
        id: map['id'],
        title: map['title'],
        desc: map['desc'],
        dateTime: map['dateTime']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'desc': desc,
      'dateTime': dateTime,
    };
  }
}
