import 'package:firebase_auth/firebase_auth.dart';
import 'package:swim_safe/models/location.dart';
import 'package:swim_safe/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser
  Location _userFromFirebaseUser(FirebaseUser location) {
    return location != null ? Location(uid: location.uid) : null;
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
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser location = result.user;
      return _userFromFirebaseUser(location);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email & password
  Future registerWithEmailAndPassword(
      String locationName, String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser location = result.user;

      // create a new document for the user with the uid
      await DatabaseService(locationName: locationName)
          .updateLocationData(locationName);
      return _userFromFirebaseUser(location);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

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
