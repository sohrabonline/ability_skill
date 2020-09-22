import 'package:flutter/material.dart';




class Task_3_Page extends StatefulWidget {
  @override
  _Task_3_PageState createState() => _Task_3_PageState();
}

class _Task_3_PageState extends State<Task_3_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task 3 Page'),
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
