import 'package:flutter/material.dart';
import 'package:routine_app_v2/screens/home/add_button/add_task_button.dart';

ListTile currentTile;

/**
 * class ToBuildRoutine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Build your Routine"),
      ),
      body: Center(child: BuildTile()
/**
 * ASK MAHIMA HOW DOES THIS WORK WITHOUT THE BUTTON ITSELF
 */
          ),
      floatingActionButton: AddTodoButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
**/

class ToBuildRoutine extends StatefulWidget {
  @override
  _ToBuildRoutineState createState() => _ToBuildRoutineState();
}

class _ToBuildRoutineState extends State<ToBuildRoutine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Build your Routine"),
      ),
      body: Center(child: BuildTile()),
      floatingActionButton: AddTodoButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class SingleTask extends StatefulWidget {
  @override
  _SingleTaskState createState() => _SingleTaskState();
}

class _SingleTaskState extends State<SingleTask> {
  @override
  Widget build(BuildContext context) {
    return currentTile = ListTile(
      leading: const Icon(
        Icons.access_alarms_sharp,
      ),
      title: Text(finName),
      subtitle: Text(displayTimeStr()),
    );
  }
}

class BuildTile extends StatefulWidget {
  @override
  _BuildTileState createState() => _BuildTileState();
}

class _BuildTileState extends State<BuildTile> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: numTasksb,
        itemBuilder: (context, index) {
          return SingleTask();
        });
  }
}

String displayTimeStr() {
  String str = '';
  if (finMin < 10 && finSec < 10) {
    str = ('0' + finMin.toString() + ":0" + finSec.toString());
  } else if (finMin < 10) {
    str = ('0' + finMin.toString() + ":" + finSec.toString());
  } else if (finSec < 10) {
    str = (finMin.toString() + ": 0" + finSec.toString());
  } else {
    str = (finMin.toString() + ":" + finSec.toString());
  }
  return str;
}
