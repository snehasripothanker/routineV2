import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routine_app_v2/models/user.dart';
import 'package:routine_app_v2/screens/wrapper.dart';
import 'package:routine_app_v2/service/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // stream is listening for auth changes
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber[200],
          fontFamily: 'Roboto',
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white70)),
          //scaffoldBackgroundColor: Colors.blueGrey[900],
          scaffoldBackgroundColor: Colors.white,
        ),
        home: Wrapper(),
      ),
    );
  }
}
