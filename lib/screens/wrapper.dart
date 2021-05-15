import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routine_app_v2/models/user.dart';
import 'package:routine_app_v2/screens/authenticate/authenticate.dart';
import 'package:routine_app_v2/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //return either home/authentication widget

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
