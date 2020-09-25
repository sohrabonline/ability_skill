import 'package:ability_skill/tasks/task_3.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',   debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}