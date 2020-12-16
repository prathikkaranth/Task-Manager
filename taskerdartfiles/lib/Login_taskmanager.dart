
import 'package:flutter/material.dart';
import 'package:flutter_app/Services/auth.dart';
import'package:flutter_app/route-generator.dart';
import 'package:flutter_app/main.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/Model/user.dart';


class tasklogin extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<tasklogin> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    String error = '';
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    constraints: BoxConstraints.expand(
                      height: 200.0,
                    ),
                    child: Image(
                        image: AssetImage('assets/taskicon.png')
                    )
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Task Manager',
                      style: TextStyle(
                          color: Color(0xff555555),
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  key: _formKey,
                  child: TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val){
                      setState(() => email = val);
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    validator: (val) => val.length < 6 ? 'Enter an password with 6+ characters' : null,
                    onChanged: (val){
                      setState(() => password = val);
                    },
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password'),
                ),
                 Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Login'),
                      onPressed: () async {
                        if(_formKey.currentState.validate()) {
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() =>
                            error = 'Please enter valid credentials');
                            print(error);
                          }
                        }
                      },
                    ),
                 ),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Do not have account?'),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(
                            'Sign in',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            //signup screen
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
              ],
            )));
  }
}
