import 'package:flutter/material.dart';
import '../Model/tasks.dart';

class TaskCard extends StatefulWidget {
  var ts;
  var val;
  Function deleteTask;
  TaskCard(this.ts, this.val, this.deleteTask);

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  var ob = TaskList();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 1),
      constraints: BoxConstraints(
          minHeight: 80, maxHeight: 120, maxWidth: 400, minWidth: 400),
      child: Card(
        color: (widget.val[0] == 'Important') ? Colors.red : Colors.green,
        elevation: 20,
        child: Stack(
          children: [
            
            Container(
              margin: EdgeInsets.only(left: 300, top: 5, right: 2),
              child: Text(
                widget.val[0],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 200, top: 5, left: 10),
              child: Text(
                widget.val[1],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40, left: 15, bottom: 10, right: 42),
              child: Text(
                widget.ts,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 355, top: 35, right: 2),
              child: InkWell(
                onTap: () => widget.deleteTask(widget.ts),
                child: Icon(
                  Icons.delete_forever,
                  color: Colors.white,
                  size: 35,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
              ),
              
            ),
          ],
        ),
      ),
    );
  }
}
