import 'package:flutter/material.dart';
import 'package:important/Data_access/data_access.dart';
import 'package:important/shared_widgets/default_appbar.dart';
import 'package:important/shared_widgets/floating_action_button_add.dart';
import 'package:important/shared_widgets/todo_list.dart';

class TodosOverviewScreen extends StatelessWidget {
  static const routeName = '/todos-overview';

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
