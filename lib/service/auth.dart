import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:routine_app_v2/models/user.dart';

String currentUserUid = '';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create User() based on FirebaseUser()

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  // everytime a user signs in/out we get a notification along the stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //       .map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  // sign in w/email and pswd
  Future signIn(String email, String pswd) async {
    AuthResult result;
    try {
      result =
          await _auth.signInWithEmailAndPassword(email: email, password: pswd);
    } catch (e) {
      print(e.toString());
      return null;
    }

    FirebaseUser userSignIn = result.user;
    currentUserUid = userSignIn.uid;

    return _userFromFirebaseUser(userSignIn);
  }

  // sign up w/email and pswd
  Future signUp(String email, String pswd) async {
    AuthResult result;
    try {
      result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pswd);
    } catch (e) {
      print(e.toString());
      return null;
    }

    FirebaseUser userSignUp = result.user;
    currentUserUid = userSignUp.uid;
    return _userFromFirebaseUser(userSignUp);
  }

  // sign out
  Future signOut() async {
    try {
      // signOut() is built into FirebaseAuth class
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
