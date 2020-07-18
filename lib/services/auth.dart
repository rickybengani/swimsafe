import 'package:firebase_auth/firebase_auth.dart';
import 'package:swim_safe/models/location.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser
  Location _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? Location(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<Location> get location {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
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
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
