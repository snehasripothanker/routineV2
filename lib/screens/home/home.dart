import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routine_app_v2/models/task.dart';
import 'package:routine_app_v2/screens/home/add_button/add_task_button.dart';
import 'package:routine_app_v2/screens/home/custom_drawer.dart';
import 'package:routine_app_v2/screens/home/task_models/tasklist.dart';
import 'package:routine_app_v2/screens/home/timer_page/time_page.dart';
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
                }),
            TextButton.icon(
                icon: Icon(Icons.check_outlined),
                label: Text('timer'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TimePage()));
                })
          ],
        ),
        //drawer: CustomDrawer(),
        floatingActionButton: AddTodoButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        body:
            // ElevatedButton(
            //   child: Text('See timer'),
            //   onPressed: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => TimePage()));
            //   },
            // ),
            TaskList(),
      ),

      // body: ElevatedButton(
      //   child: Text('Create routine.'),
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => ToBuildRoutine()),
      //     );
      //   },
      // ),
    );
  }
}
