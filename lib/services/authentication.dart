import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:pet_adoption/models/user.dart';

class AuthenticationService {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  User _userFromFirebaseUser(auth.User? user) {
    return user != null ? User(uid: user.uid) : User(uid: "-1");
  }

  Stream<User> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future<bool> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final auth.User user = (await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;

    if (user != null) {
      print("LOGGED IN AS ${user.displayName}");
      return true;
    } else {
      print("FAILED LOG IN");
      return false;
    }
  }
}
