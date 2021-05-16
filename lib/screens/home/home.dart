import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routine_app_v2/models/task.dart';
import 'package:routine_app_v2/screens/home/add_button/add_task_button.dart';
import 'package:routine_app_v2/screens/home/add_button/widget_task_button.dart';
import 'package:routine_app_v2/screens/home/tasklist.dart';
import 'package:routine_app_v2/service/auth.dart';
import 'package:routine_app_v2/service/database.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Task>>.value(
        value: DatabaseService().tasksStream,
        child: Scaffold(
          backgroundColor: Colors.green[50],
          appBar: AppBar(
              title: Text('Routine'),
              backgroundColor: Colors.green[300],
              actions: <Widget>[
                TextButton.icon(
                    icon: Icon(Icons.person),
                    label: Text('logout'),
                    onPressed: () async {
                      await _auth.signOut();
                    })
              ]),

          floatingActionButton: AddTodoButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,

          body: TaskList(),
          // body: ElevatedButton(
          //   child: Text('Create routine.'),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => ToBuildRoutine()),
          //     );
          //   },
          // ),
        ));
  }
}
