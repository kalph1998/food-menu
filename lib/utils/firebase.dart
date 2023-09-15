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

  updateUserName(String name) async {
    await _firebase.currentUser?.updateDisplayName(name);
  }

  get currentUser {
    return _firebase.currentUser;
  }

  get userName {
    return _firebase.currentUser?.displayName;
  }

  get userToken {
    return _firebase.currentUser?.refreshToken;
  }
}
