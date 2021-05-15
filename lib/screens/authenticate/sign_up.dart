import 'package:flutter/material.dart';
import 'package:routine_app_v2/screens/authenticate/sign_in.dart';
import 'package:routine_app_v2/service/auth.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String error = '';
  String email = '';
  String pswd = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[100],
        appBar: AppBar(
          title: Text('Sign Up to Routine'),
          backgroundColor: Colors.green[300],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (val) =>
                        val.isEmpty ? 'Please enter an email.' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (val) => val.length < 6
                        ? 'Please enter a password with 6 or more characters.'
                        : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => pswd = val);
                    },
                  ),
                  SizedBox(height: 20),

                  // bug with firestore?
                  TextButton(
                    child: Text('Sign Up'),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic result;
                        try {
                          result = await _auth.signUp(email, pswd);
                        } catch (e) {
                          setState(() => error = 'Please enter a valid email.');
                        }
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  Text("Already have an account?"),
                  TextButton(
                    child: Text("Sign In"),
                    onPressed: () {
                      widget.toggleView();
                    },
                  ),
                ],
              )),
        ));
  }
}
