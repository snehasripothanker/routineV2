import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:routine_app_v2/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create User() based on FirebaseUser()

  User _userFromFirebaseUser(FirebaseUser user) {
    if (user == null) {
      print('error: FirebaseUser user is null/empty');
    }

    return User(uid: user.uid);
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

}
