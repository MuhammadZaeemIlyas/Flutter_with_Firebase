import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<User?> signupwithEmailandPasssword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<User?> signInwithEmailandPasssword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future AddUserDetails(
    String name,
    String fathername,
    double age,
  ) async {
    await _store.collection('Users').add({
      'Name': name,
      'Father Name': fathername,
      'Age': age,
    });
  }
}
