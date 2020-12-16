import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewEntry extends StatefulWidget {
  final Function newtask;
  NewEntry(this.newtask);

  @override
  _NewEntryState createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
  String task;
  DateTime selectedDate;
  String taskType = '';
  var val = false;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2021),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
    print({DateFormat.d().format(selectedDate)});
    // print(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              style: TextStyle(fontSize: 25),
              decoration: InputDecoration(labelText: 'Task:'),
              onChanged: (value) {
                task = value;
              },
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Picked Date: ${DateFormat.MMMMd().format(selectedDate)}',
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.indigo,
                      ),
                    ),
                    onPressed: _presentDatePicker,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: CheckboxListTile(
                title: Text(
                  'Mark as Important',
                  style: TextStyle(fontSize: 25),
                ),
                subtitle: Text(
                  'The Important tasks will be Displayed Red',
                  style: TextStyle(fontSize: 14),
                ),
                value: val,
                onChanged: (value) {
                  setState(() {
                    val = value;
                  });
                  if (value == true) {
                    taskType = 'Important';
                  } else {
                    taskType = '';
                  }
                },
              ),
            ),
            RaisedButton(
              onPressed: () => widget.newtask(
                task,
                selectedDate,
                taskType,
              ),
              color: Colors.green,
              child: Text(
                'Add',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
