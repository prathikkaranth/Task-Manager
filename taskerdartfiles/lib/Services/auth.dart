import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/Model/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on FirebaseUser
  MyUser _userFromFirebaseUser(User user){
    return user != null? MyUser(uid: user.uid) : null;
  }
  //auth change user stream
  Stream<MyUser> get user {
    return _auth.authStateChanges()
        .map(_userFromFirebaseUser);
  }

  //sign in anon
  Future signInAnon() async {
    try{
      UserCredential userCredential = await _auth.signInAnonymously();
      User user = userCredential.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}