import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthRepo = Provider((ref) => FirebaseAuthRepo());

class FirebaseAuthRepo {
  static final firebaseInstance = FirebaseAuth.instance;

  Stream<User?> user = firebaseInstance.authStateChanges();

  Future<String> loginUser(String email, String password) async {
    try {
      final response = await firebaseInstance.signInWithEmailAndPassword(
          email: email, password: password);
      return "Login Successful";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  Future<String> registerUser(String email, String password) async {
    try {
      final response = await firebaseInstance.createUserWithEmailAndPassword(
          email: email, password: password);
      return "SIgnup Successful";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  signOutUser() async {
    await firebaseInstance.signOut();
  }
}
