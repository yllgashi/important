import 'package:flutter/material.dart';
import 'package:important/models/data_access.dart';
import 'package:important/widgets/default_appbar.dart';
import 'package:important/widgets/floating_action_button_add.dart';
import 'package:important/widgets/todo_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Important',
      home: Scaffold(
        appBar: DefaultAppBar(DataAccess.todos).build(context),
        body: Container(
          child: TodoList(DataAccess.todos, DataAccess.doneTodos),
        ),
        floatingActionButton: FloatingActionButtonAdd(DataAccess.todos),
      ),
    );
  }
}