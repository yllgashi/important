import 'package:flutter/material.dart';
import 'package:important/Data_access/data_access.dart';
import 'package:important/widgets/default_appbar.dart';
import 'package:important/widgets/todo_list.dart';

class FinishedTodos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(DataAccess.doneTodos).build(context),
        body: Container(
          child: TodoList(DataAccess.doneTodos, DataAccess.todos),
        ),
    );
  }
}
