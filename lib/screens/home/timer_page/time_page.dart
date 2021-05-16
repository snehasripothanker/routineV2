import 'package:flutter/material.dart';
import 'package:routine_app_v2/screens/home/custom_drawer.dart';

class TimePage extends StatefulWidget {
  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer'),
      ),
      body: Text('hi'),
    );
  }
}
