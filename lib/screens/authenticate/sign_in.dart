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
  final _formKey = GlobalKey<FormState>();

  String error = '';

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
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Username',
                    ),
                    validator: (val) =>
                        val.isEmpty ? 'Please enter an email.' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'Password',
                    ),
                    validator: (val) => val.length < 6
                        ? 'Please enter a password with 6 or more characters.'
                        : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => pswd = val);
                    },
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    child: Text('Sign In'),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic result;
                        try {
                          result = await _auth.signIn(email, pswd);
                        } catch (e) {
                          setState(() => error = 'Please enter a valid email.');
                        }
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  Text("Don't have an account?",
                      style: TextStyle(color: Colors.black54)),
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
