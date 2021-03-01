import 'package:firebase_auth/firebase_auth.dart';
import 'package:vouku/models/RealUser.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create User Object Based on FirebaseUser
  RealUser _userFromFirebaseUser(User user) {
    return user != null ? RealUser(uid: user.uid) : null;
  }

  // Auth Change User Stream
  Stream<RealUser> get user {
    return _auth.authStateChanges()
        .map(_userFromFirebaseUser);
  }

  // Sign In Anonymous
  Future signInAnonymous() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Sign In with Email & Password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Register with Email & Password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Sign Out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}