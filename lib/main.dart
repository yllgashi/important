import 'package:flutter/material.dart';
import 'package:important/models/ToDoNote.dart';
import 'package:important/utilities/constants.dart';
import 'package:important/utilities/temp_values.dart';
import 'package:important/widgets/create_todo_dialog.dart';
import 'package:important/widgets/floating_action_button_add.dart';
import 'package:important/widgets/todo_list.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  List<ToDoNote> todos = [];

  @override
  Widget build(BuildContext context) {
    // temp todos
    todos = [];
    TempValues.generateNote(todos);

    return MaterialApp(
      title: 'Important',
      home: Scaffold(
        appBar: navBar(),
        body: Container(
          child: TodoList(todos),
        ),
        floatingActionButton: FloatingActionButtonAdd(todos),
      ),
    );
  }

  Widget navBar() {
    return AppBar(
      title: Text('Important'),
      backgroundColor: Constants.primaryColor,
      actions: [
        IconButton(icon: Icon(Icons.search_outlined), onPressed: () {}),
        IconButton(icon: Icon(Icons.group_work_outlined), onPressed: () {}),
        IconButton(icon: Icon(Icons.alarm_on_outlined), onPressed: () {}),
      ],
    );
  }
}
