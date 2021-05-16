import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routine_app_v2/models/task.dart';
import 'package:routine_app_v2/screens/home/task_models/tasktile.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<List<Task>>(context);

    // tasks.forEach((task) {
    //   print(task.name);
    //   print(task.timeMin);
    //   print(task.timeSec);
    // });

    //return Container();

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(task: tasks[index]);
      },
    );
  }
}
