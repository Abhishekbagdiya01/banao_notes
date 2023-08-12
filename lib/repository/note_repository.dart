import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:note_app/models/note_model.dart';

class NoteRepository {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> addNote(NoteModel noteModel) async {
    String res = "";
    final email = await _auth.currentUser!.email;

    String noteId = _firestore.collection(email!).doc().id;

    try {
      await _firestore
          .collection(email)
          .doc(noteId)
          .set(NoteModel(
                  id: noteId,
                  title: noteModel.title,
                  desc: noteModel.desc,
                  dateTime: noteModel.dateTime)
              .toJson())
          .then((value) {
        res = "success";
        print("res : " + res);
      });
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<String> updateNote(NoteModel noteModel) async {
    String res = "";
    final email = await _auth.currentUser!.email;

    try {
      await _firestore
          .collection(email!)
          .doc(noteModel.id)
          .set(NoteModel(
                  id: noteModel.id,
                  title: noteModel.title,
                  desc: noteModel.desc,
                  dateTime: noteModel.dateTime)
              .toJson())
          .then((value) {
        res = "success";
        print("res : " + res);
      });
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<String> deleteNote(String noteId) async {
    String res = "";
    final email = await _auth.currentUser!.email;

    try {
      await _firestore.collection(email!).doc(noteId).delete().then((value) {
        res = "success";
        print("res : " + res);
      });
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchNotes() async {
    final email = await _auth.currentUser!.email;
    var NotesArr = await _firestore.collection(email!).get();

    return NotesArr;
  }
}
