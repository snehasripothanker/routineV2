import 'package:flutter/material.dart';
import 'package:routine_app_v2/screens/authenticate/sign_in.dart';
import 'package:routine_app_v2/screens/authenticate/sign_up.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool isUser = true;

  void toggleView() {
    setState(() => isUser = !isUser);
  }

  @override
  Widget build(BuildContext context) {
    if (isUser) {
      return SignIn(toggleView: toggleView);
    } else {
      return SignUp(toggleView: toggleView);
    }
  }
}
