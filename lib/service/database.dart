import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:routine_app_v2/models/task.dart';
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
        .document(task.name)
        .setData({
      'name': task.name,
      'time (mins)': task.timeMin,
      'time (secs)': task.timeSec,
    });
  }
}
