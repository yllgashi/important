import 'package:flutter/material.dart';
import 'package:important/screens/done_todos.dart';
import 'package:important/utilities/constants.dart';
import 'package:important/widgets/default_appbar.dart';
import 'package:important/widgets/floating_action_button_add.dart';
import 'package:important/widgets/todo_list.dart';
import 'models/data_access.dart';
import 'package:important/widgets/search.dart';
import 'package:important/screens/done_todos.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // temp todos
    // TempValues.generateNote(todos);

    return MaterialApp(
      title: 'Important',
      home: Scaffold(
        appBar: DefaultAppBar().build(context),
        body: Container(
          child: TodoList(DataAccess.todos, DataAccess.doneTodos),
        ),
        floatingActionButton: FloatingActionButtonAdd(DataAccess.todos),
      ),
    );
  }
}
