import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationWrapper {
  final _firebase = FirebaseAuth.instance;

  Future<UserCredential> createUser(
      {required String email, required String password}) {
    return _firebase.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> loginUser(
      {required String email, required String password}) {
    return _firebase.signInWithEmailAndPassword(
        email: email, password: password);
  }
}
