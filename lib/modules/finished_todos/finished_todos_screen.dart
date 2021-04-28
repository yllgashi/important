import 'package:flutter/material.dart';
import 'package:important/Data_access/data_access.dart';
import 'package:important/shared_widgets/default_appbar.dart';
import 'package:important/shared_widgets/todo_list.dart';

class FinishedTodosScreen extends StatelessWidget {
  static const routeName = '/finished-todos';

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
