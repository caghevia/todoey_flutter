import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/modules/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newtaskTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30,
              ),
            ),
            TextField(
              onChanged: (newValue) {
                setState(() {
                  newtaskTitle = newValue;
                });
              },
              autofocus: true,
              textAlign: TextAlign.center,
            ),
            FlatButton(
              onPressed: () {
                print(newtaskTitle);
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newtaskTitle);
                Navigator.pop(context);
              },
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              color: Colors.lightBlueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
