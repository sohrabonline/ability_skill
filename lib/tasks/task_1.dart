import 'package:flutter/material.dart';




class Task_1_Page extends StatefulWidget {
  @override
  _Task_1_PageState createState() => _Task_1_PageState();
}

class _Task_1_PageState extends State<Task_1_Page> {
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
