import 'package:flutter/material.dart';
import 'package:important/utilities/constants.dart';
import 'package:important/widgets/todo_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Important',
      home: Scaffold(
        appBar: navBar(),
        body: Container(
          child: TodoList(),
        ),
        floatingActionButton: floatingButton(),
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

  FloatingActionButton floatingButton() {
    return FloatingActionButton(
      tooltip: 'Add',
      child: Icon(Icons.add),
      backgroundColor: Constants.primaryColor,
      onPressed: () {},
    );
  }
}
