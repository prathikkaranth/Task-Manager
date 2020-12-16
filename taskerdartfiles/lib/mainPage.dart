import 'package:flutter_app/firebaseAuthDemo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/route-generator.dart';

class MainPage extends StatefulWidget {
  final User user;

  const MainPage({Key key, this.user}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        width: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                constraints: BoxConstraints.expand(
                  height: 200.0,
                ),
                child: Image(
                    image: AssetImage('assets/taskicon.png')
                )
            ),
            Container(
              child: Text(
                widget.user.displayName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Container(
              child: OutlineButton(
                child: Text("LogOut"),
                onPressed: () {
                  _signOut().whenComplete(() {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => FirebaseAuthDemo()));
                  });
                },
              ),
            ),
            Container(
              child: OutlineButton(
                child: Text("Go to Dashboard"),
                onPressed: () {
                  _signOut().whenComplete(() {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Dashboard()));
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future _signOut() async {
    await _auth.signOut();
  }
}