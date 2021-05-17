import 'dart:async';

import 'package:flutter/material.dart';

class MyTimer extends StatefulWidget {
  final int duration;
  MyTimer({Key key, this.duration}) : super(key: key);

  @override
  _MyTimerState createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {
  int counter;
  Timer timer;
  void startTimer(int uniqueDuration) {
    counter = uniqueDuration;
    if (timer != null) {
      timer.cancel();
    }
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (counter > 0) {
          counter--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            (counter > 0)
                ? Text("")
                : Text('DONE!',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold)),
            Text(
              '$counter',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                startTimer(widget.duration);
              },
              child: Text('Start 10 second countdown'),
            )
          ]),
    );
  }
}
