import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:routine_app_v2/models/task.dart';
import 'package:routine_app_v2/service/auth.dart';
import 'package:routine_app_v2/service/database.dart';

//NOT MY CODE: OUTSOURCED FROM https://github.com/funwithflutter/flutter_ui_tips/blob/master/tip_003_popup_card/lib/add_todo_button.dart

//import 'package:flutter/material.dart';
//import 'package:popup_card/styles.dart';

import 'custom_rect_tween.dart';
import 'hero_dialog_route.dart';

/// {@template add_todo_button}
/// Button to add a new [Todo].
///
/// Opens a [HeroDialogRoute] of [_AddTodoPopupCard].
///
/// Uses a [Hero] with tag [_heroAddTodo].
/// {@endtemplate}

var selectedMin = 0;
var selectedSec = 0;
var finMin = 0;
var finSec = 0;
var finName = '';
int numTasksb = 0;
DatabaseService dbservice = DatabaseService();

TextEditingController taskNameController = new TextEditingController();

class AddTodoButton extends StatelessWidget {
  /// {@macro add_todo_button}
  const AddTodoButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return const _AddTodoPopupCard();
          }));
        },
        child: Hero(
          tag: _heroAddTodo,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },
          child: Material(
            color: Theme.of(context).primaryColor,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: const Icon(
              Icons.add_rounded,
              size: 56,
            ),
          ),
        ),
      ),
    );
  }
}

/// Tag-value used for the add todo popup button.
const String _heroAddTodo = 'add-todo-hero';

/// {@template add_todo_popup_card}
/// Popup card to add a new [Todo]. Should be used in conjuction with
/// [HeroDialogRoute] to achieve the popup effect.
///
/// Uses a [Hero] with tag [_heroAddTodo].
/// {@endtemplate}
class _AddTodoPopupCard extends StatelessWidget {
  /// {@macro add_todo_popup_card}
  const _AddTodoPopupCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroAddTodo,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },
          child: Material(
            color: Theme.of(context).primaryColor,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: taskNameController,
                      decoration: InputDecoration(
                        hintText: 'Enter task name',
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.white,
                    ),
                    const Divider(
                      color: Colors.black87,
                      thickness: 0.2,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: ListView(
                                children: _makeTiles(60),

                                //itemExtent: 20,
                                //physics: ,
                                //perspective: 0.0000000001,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text('min',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Expanded(
                              child: Center(
                            child: ListView(
                              children: _makeTiles(59),
                              //itemExtent: 20,
                              //physics: FixedExtentScrollPhysics(),
                              //perspective: 0.0000000001,
                            ),
                          )),
                          Expanded(
                            child: Text('sec',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      height: 100,
                    ),
                    const Divider(
                      color: Colors.black87,
                      thickness: 0.2,
                    ),
                    Text(
                      'Be sure to click on your timer choices - not just scroll to them.',
                      style: TextStyle(color: Colors.blue[100]),
                    ),
                    /**Text(
                      _updateSelected(),
                      style: TextStyle(color: Colors.purple),
                    ),
                    **/
                    TextButton(
                      onPressed: () {
                        finishSelection();
                        Task newTask = Task(
                          name: finName,
                          timeMin: finMin,
                          timeSec: finSec,
                          index: numTasksb,
                        );
                        numTasksb++;

                        // add database
                        addToDatabase(newTask);

                        Navigator.of(context)
                            .pop(HeroDialogRoute(builder: (context) {
                          return const _AddTodoPopupCard();
                        }));
                      },
                      child: Text(
                        'Add',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void addToDatabase(Task task) async {
  await dbservice.addUserData(task);
}

List<Widget> minutes = [];

List _makeTiles(int max) {
  minutes = List.generate(max - 1, (int index) {
    return new ListTile(
      title: Text(
        (index + 1).toString(),
        style: TextStyle(
          color: Colors.amber,
        ),
      ),
      onTap: () {
        if (max == 60) {
          selectedMin = index + 1;
          print(selectedMin.toString() + ' MIN');
        } else {
          selectedSec = index + 1;
          print(selectedSec.toString() + ' SEC');
        } //if you want to assign the index somewhere to check
      },
    );
  });

  return minutes;
}

void finishSelection() {
  finMin = selectedMin;
  finSec = selectedSec;
  finName = taskNameController.text;

  print(finMin.toString() + ' FIN MIN');
  print(finSec.toString() + ' FIN SEC');
  print(finName + ' FIN name ');
}

/**String _updateSelected() {
  return selectedMin.toString() + ':' + selectedSec.toString();
}
*/

/** 

  for (var i = 1; i <= max; i++) {
    minutes.add(ListTile(
      title: Text(
        i.toString(),
        style: TextStyle(color: Colors.red),
      ),
      onLongPress: () {
        if (i == 60) {
          print(minutes[i - 1].toString() + ' min was tapped');
        }
        //       if(max == 60){
        //       selectedMin =
        //   }
      },
    ));
  }
  return minutes;

  */
