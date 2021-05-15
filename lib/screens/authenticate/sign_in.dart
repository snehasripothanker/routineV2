import 'package:flutter/material.dart';
import 'package:routine_app_v2/service/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  String email = '';
  String pswd = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[100],
        appBar: AppBar(
          title: Text('Sign In to Routine'),
          backgroundColor: Colors.green[300],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
              child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() => pswd = val);
                },
              ),
              SizedBox(height: 20),
              TextButton(
                child: Text('Sign In'),
                onPressed: () async {
                  print(email);
                  print(pswd);
                },
              ),
              SizedBox(height: 20),
              Text("Don't have an account?"),
              TextButton(
                child: Text("Sign Up"),
                onPressed: () {
                  widget.toggleView();
                },
              ),
            ],
          )),
        ));
  }
}
