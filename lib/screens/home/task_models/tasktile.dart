import 'dart:async';

import 'package:flutter/material.dart';
import 'package:routine_app_v2/models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  TaskTile({this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.access_alarms_sharp,
        size: 40.0,
      ),
      title: Text(
        task.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        displayTimeStr(),
        style: TextStyle(fontSize: 15, color: Colors.green[900]),
      ),
    );
  }

  String displayTimeStr() {
    String str = '';
    if (task.timeMin < 10 && task.timeSec < 10) {
      str = (task.timeMin.toString() + ":0" + task.timeSec.toString());
    } else if (task.timeMin < 10) {
      str = (task.timeMin.toString() + ":" + task.timeSec.toString());
    } else if (task.timeSec < 10) {
      str = (task.timeMin.toString() + ":0" + task.timeSec.toString());
    } else {
      str = (task.timeMin.toString() + ":" + task.timeSec.toString());
    }
    return str;
  }
}
