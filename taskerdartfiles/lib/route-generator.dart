import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Login_taskmanager.dart';
import 'package:flutter_app/Widget/start.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/profilepage.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_app/Services/auth.dart';
import 'package:flutter_app/Model/user.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  Material myItems(IconData icon,String heading,int color,Function f){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(heading,
                      style: TextStyle(
                          color:new Color(color),
                          fontSize: 20
                      ),
                    ),
                  ),
                  Material(
                    color: new Color(color),
                    borderRadius: BorderRadius.circular(24),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child:InkWell(
                        onTap: () => Navigator.push(context,new MaterialPageRoute(
                            builder: (context) => f()
                        ),
                        ),
                        child:  Icon(
                          icon,
                          color: Colors.white,
                          size: 30,
                        ),

                      ),

                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context){
    final AuthService _auth = AuthService();
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff555555),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async {
               await _auth.signOut();
            },
          )
        ],
      ),
      body: StaggeredGridView.count(
        crossAxisCount: 1,
        crossAxisSpacing: 12.0 ,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: <Widget>[
          myItems(Icons.account_circle,'Profile',0xff555555,() => Profile()),
          myItems(Icons.add_sharp,"Schedule a Task",0xff555555,() => MyHomePage()),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 130),
          StaggeredTile.extent(2, 130),
          StaggeredTile.extent(2, 130),
        ],
      ),
    );
  }

}

