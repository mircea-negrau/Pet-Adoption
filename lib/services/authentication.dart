import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:pet_adoption/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart' as g_auth;

class AuthenticationService {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  User? _userFromFirebaseUser(auth.User? user) {
    if (user == null) return null;
    return User(uid: user.uid, name: user.displayName, photoUrl: user.photoURL);
  }

  Stream<User?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on auth.FirebaseAuthException catch (e) {
      return e;
    }
    return true;
  }

  Future signOut() async {
    auth.FirebaseAuth.instance.signOut();
    await g_auth.GoogleSignIn().signOut();
  }

  Future<auth.UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final g_auth.GoogleSignInAccount googleUser =
        await g_auth.GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final g_auth.GoogleSignInAuthentication googleAuth =
        await googleUser.authentication!;

    // Create a new credential
    final credential = auth.GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return auth.FirebaseAuth.instance.signInWithCredential(credential);
  }
}
