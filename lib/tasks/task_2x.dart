import 'package:flutter/material.dart';
import 'dart:math';



class Task_2x_Page extends StatefulWidget {
  @override
  _Task_2x_PageState createState() => _Task_2x_PageState();
}

class _Task_2x_PageState extends State<Task_2x_Page> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task 1 Page'),
      ),
      body: Center(
        child: Container(
          child: Column(children: [

            RaisedButton(onPressed: null,child: Text("Task 1"),)
          ],),
        ),
      ),
    );
  }
}
