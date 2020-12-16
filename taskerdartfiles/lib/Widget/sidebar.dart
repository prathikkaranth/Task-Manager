import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Card(
            color: Colors.indigo,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(24),
                  child: Text(
                    '\tChoose One ',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 380,
                  height: 100,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () => {},
            child: Card(
                elevation: 0,
                child: Center(
                  child: Text(
                    'Important',
                    style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () => {},
            child: Container(
              child: Card(
                  elevation: 0,
                  child: Center(
                    child: Text(
                      'All Task\'s',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber[700],
                      ),
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () => {},
            child: Card(
                elevation: 0,
                child: Center(
                  child: Text(
                    'New+',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
