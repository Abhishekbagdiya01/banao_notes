import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:note_app/models/user_model.dart';

class AuthRepository {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createUser(
      {required String name,
      required String email,
      required String password}) async {
    String res = "";
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
        (value) {
          print(value);
          UserModel userModel =
              UserModel(id: _auth.currentUser!.uid, email: email, name: name);

          _firestore.collection("User").doc(email).set(userModel.toJson());

          res = "success";
        },
      );
    } on FirebaseAuthException catch (e) {
      res = e.message.toString();
    }
    return res;
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = '';
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        print(value);
        res = "success";
      });
    } on FirebaseAuthException catch (e) {
      res = e.message.toString();
    }

    return res;
  }
}
