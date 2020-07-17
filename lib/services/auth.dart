import 'package:firebase_auth/firebase_auth.dart';
import 'package:swim_safe/models/lifeguard.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser
  Lifeguard _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? Lifeguard(uid: user.uid) : null;
  }

  // sign in anonymous
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email & password

  // register with email & password

  // sign out
}
