import 'package:flutter/material.dart';
import '../Model/tasks.dart';
import './sidebar.dart';
import './card.dart';
import './new_entry.dart';
import './info_card.dart';
import 'package:intl/intl.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var ob1 = TaskList();
  int imp = 0;
  int displayList = 0;

  void dispLst(displist) {
    setState(() {
      displayList = displist;
    });
  }

  Widget printList(k, taskf, deleteTask) {
    if (displayList == 1) {
      if (taskf[0] == 'Important') {
        return TaskCard(k, taskf, deleteTask);
      } else {
        return Container(color: Colors.white // This is optional
            );
      }
    } else {
      return TaskCard(k, taskf, deleteTask);
    }
  }

  void newtask(task, date, taskType) {
    var currDt = DateTime.now();
    if (task.isEmpty) {
      return;
    } else {
      if (currDt.month.toString() == DateFormat.M().format(date).toString() &&
          currDt.day.toString() == DateFormat.d().format(date).toString()) {
        date = 'Today';
      } else if (currDt.month.toString() ==
              DateFormat.M().format(date).toString() &&
          (int.parse(DateFormat.d().format(date).toString()) -
                  int.parse(currDt.day.toString()) ==
              1)) {
        date = 'Tomorrow';
      } else if (currDt.month.toString() ==
              DateFormat.M().format(date).toString() &&
          (int.parse(DateFormat.d().format(date).toString()) -
                  int.parse(currDt.day.toString()) <
              0)) {
        date = 'Task Due';
      } else {
        date = DateFormat.MMMMd().format(date).toString();
      }
      setState(() {
        ob1.tasks[task] = [taskType, 'Due: $date'];
        if (taskType == 'Important') {
          imp = imp + 1;
        }
      });
    }

    // print(ob1.tasks.runtimeType);
    Navigator.of(context).pop();
  }

  void deleteTask(String removetask) {
    setState(() {
      if (ob1.tasks[removetask][0] == 'Important') {
        imp = imp - 1;
      }
      ob1.tasks.remove(removetask);
    });
  }

  void startAddNewTask(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewEntry(newtask);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff555555),
        title: Text('Task-Manager ', style: TextStyle(fontSize: 25)),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add_circle,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () => startAddNewTask(context),
          )
        ],
      ),
      drawer: Sidebar(),
      body: ob1.tasks.length == 0
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'No Task\'s Present ',
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 5,
                    ),
                    InfoCard(
                      ob1.tasks.length.toString(),
                      imp.toString(),
                      dispLst,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 10,
                    ),
                    for (var k in ob1.tasks.keys)
                      printList(k, ob1.tasks[k], deleteTask),
                  ],
                ),
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        child: Icon(Icons.add),
        onPressed: () {
          startAddNewTask(context);
        },
      ),
    );
  }
}
