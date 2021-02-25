import 'package:flutter/material.dart';
import 'package:important/screens/finishedTodos.dart';
import 'package:important/screens/home.dart';
import 'package:important/screens/finishedTodos.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Home _home = Home();
  FinishedTodos _finishedTodos = FinishedTodos();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Important',
      routes: <String, WidgetBuilder> {
        '/Home': (BuildContext context) => _home,
        '/FinishedTodos': (BuildContext context) => _finishedTodos,
      },
      home: _home,
    );
  }
}