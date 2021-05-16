import 'dart:async';

import 'package:flutter/material.dart';
import 'package:routine_app_v2/screens/home/home.dart';
import 'package:routine_app_v2/screens/home/timer_page/time_page.dart';
import 'package:routine_app_v2/screens/wrapper.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool onRoutine = true;

    return Drawer(
        child: ListView(
      children: [
        DrawerHeader(child: Text('Welcome to Routine!')),
        ListTile(
            title: Text('Set up your Routine'),
            onTap: () {
              if (onRoutine) {
                // Navigator.pop(context,
                //     MaterialPageRoute(builder: (context) => TimePage()));
                Navigator.pop(context);
              } else {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
                onRoutine = !onRoutine;
              }
            }),
        ListTile(
            title: Text('Timer'),
            onTap: () {
              if (!onRoutine) {
                Navigator.pop(context);
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TimePage()));
                onRoutine = !onRoutine;
              }
            })
      ],
    ));
  }
}
