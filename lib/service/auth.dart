import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:routine_app_v2/models/user.dart';

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

  // sign up w/email and pswd

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
