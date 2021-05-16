import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:routine_app_v2/models/task.dart';
import 'package:routine_app_v2/screens/home/task_models/tasklist.dart';
import 'package:routine_app_v2/service/auth.dart';

class DatabaseService {
  //final String uid;
  //final String email;

  //DatabaseService({this.uid, this.email});

  // collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future addUserData(Task task) async {
    // userCollection.document(currentUserUid).setData({
    //   'email': email,
    // });

    return await userCollection
        .document(currentUserUid)
        .collection('tasklist')
        .document('task' + task.index.toString())
        .setData({
      'name': task.name,
      'time (mins)': task.timeMin,
      'time (secs)': task.timeSec,
    });
  }

  // get Task()s from QuerySnapshot
  List<Task> _taskListFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Task(
        name: doc.data['name'] ?? 'NO NAME GIVEN',
        timeMin: doc.data['time (mins)'] ?? 0,
        timeSec: doc.data['time (secs)'] ?? 0,
      );
    }).toList();
  }

  // get tasks stream
  Stream<List<Task>> get tasksStream {
    return userCollection
        .document(currentUserUid)
        .collection('tasklist')
        .snapshots()
        .map(_taskListFromSnapShot);
  }
}
