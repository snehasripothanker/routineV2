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
      ),
      title: Text(task.name),
      subtitle: Text(displayTimeStr()),
    );
  }

  String displayTimeStr() {
    String str = '';
    if (task.timeMin < 10 && task.timeSec < 10) {
      str = ('0' + task.timeMin.toString() + ":0" + task.timeSec.toString());
    } else if (task.timeMin < 10) {
      str = ('0' + task.timeMin.toString() + ":" + task.timeSec.toString());
    } else if (task.timeSec < 10) {
      str = (task.timeMin.toString() + ": 0" + task.timeSec.toString());
    } else {
      str = (task.timeMin.toString() + ":" + task.timeSec.toString());
    }
    return str;
  }
}
