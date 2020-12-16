import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Login_taskmanager.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/route-generator.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{

  Widget textfield({@required String hintText}){
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          letterSpacing: 2,
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none
        )
      ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xff555555),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 450,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    textfield(
                        hintText: 'Username',
                    ),
                    textfield(
                      hintText: 'Email',
                    ),
                    textfield(
                      hintText: 'Department',
                    ),
                    textfield(
                      hintText: 'Password',
                    ),
                    Container(
                      height: 55,
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.black54,
                        child: Center(
                          child: Text("Update",style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(image: AssetImage('assets/profile.jpg')),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 270,left: 184),
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(
                  icon: Icon(Icons.edit,color: Colors.white),
                  onPressed: () {} ,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
