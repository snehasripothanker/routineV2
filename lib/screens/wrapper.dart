import 'package:flutter/material.dart';
import 'package:routine_app_v2/screens/authenticate/authenticate.dart';
import 'package:routine_app_v2/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either home/authentication widget
    return Home();
  }
}
