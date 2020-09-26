import 'package:ability_skill/tasks/task_2x.dart';
import 'package:ability_skill/tasks/task_1.dart';
import 'package:ability_skill/tasks/task_3.dart';
import 'package:ability_skill/tasks/task_4.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stage 2'),
      ),
      body: Center(
        child: Container(
          child: Column(   mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton( color: Colors.yellow,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Task_1_Page()));
                },
                child: Text("Task 1"),
              ),
/*
              RaisedButton( color: Colors.amber,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Task_2x_Page()));
                },
                child: Text("Task 2"),
              )   ,
*/

              RaisedButton( color: Colors.blue,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Task_3_Page()));
                },
                child: Text("Task 3",style: TextStyle(color: Colors.white),),
              )
,

            ],
          ),
        ),
      ),
    );
  }
}
