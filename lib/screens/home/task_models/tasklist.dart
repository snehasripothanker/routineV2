import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routine_app_v2/models/task.dart';
import 'package:routine_app_v2/screens/home/task_models/tasktile.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

int cumMins = 0;
int cumSecs = 0;

List<Task> completeList = [];

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    final tasksListProvider = Provider.of<List<Task>>(context);
    completeList = tasksListProvider;
    // tasks.forEach((task) {
    //   print(task.name);
    //   print(task.timeMin);
    //   print(task.timeSec);
    // });

    //return Container();

    int lenList() {
      if (tasksListProvider == null) {
        return 0;
      } else {
        return tasksListProvider.length;
      }
    }

    void cumulativeVal() {
      cumMins = 0;
      cumSecs = 0;
      if (tasksListProvider != null) {
        tasksListProvider.forEach((task) {
          cumMins += task.timeMin;
          cumSecs += task.timeSec;
        });
      }
    }

    cumulativeVal();

    return ListView.builder(
      itemCount: lenList(),
      itemBuilder: (context, index) {
        return TaskTile(task: tasksListProvider[index]);
      },
    );
  }
}
