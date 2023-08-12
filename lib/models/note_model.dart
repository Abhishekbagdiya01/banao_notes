import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  String? id;
  String? title;
  String? desc;
  String? dateTime;

  NoteModel({this.id, this.title, this.desc, this.dateTime});

  static fromSnap(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return NoteModel(
        id: data['id'],
        title: data['title'],
        desc: data['desc'],
        dateTime: data['dateTime']);
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
