import 'package:flutter/material.dart';
import 'package:important/screens/done.dart';
import 'package:important/utilities/constants.dart';
import 'package:important/widgets/floating_action_button_add.dart';
import 'package:important/widgets/todo_list.dart';
import 'models/data_access.dart';
import 'package:important/widgets/search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // temp todos
    // TempValues.generateNote(todos);

    return MaterialApp(
      title: 'Important',
      home: Scaffold(
        appBar: navBar(),
        body: Container(
          child: TodoList(DataAccess.todos, DataAccess.doneTodos),
        ),
        floatingActionButton: FloatingActionButtonAdd(DataAccess.todos),
      ),
    );
  }

  Widget navBar() {
    return AppBar(
      title: Text('Important'),
      backgroundColor: Constants.primaryColor,
      actions: [
        SearchButton(DataAccess.todos),
        IconButton(icon: Icon(Icons.group_work_outlined), onPressed: () {
          DoneScreen();
        }),
        IconButton(icon: Icon(Icons.alarm_on_outlined), onPressed: () {}),
      ],
    );
  }
}
