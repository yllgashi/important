import 'package:flutter/material.dart';
import 'package:important/Data_access/data_access.dart';
import 'package:important/modules/todos_overview/components/create_todo_dialog.dart';
import 'package:important/shared_widgets/base_screen.dart';
import 'package:important/shared_widgets/todo_list.dart';

class TodosOverviewScreen extends StatelessWidget {
  static const routeName = '/todos-overview';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BaseScreen(
      child: Container(
        width: double.infinity,
        height: mediaQuery.size.height,
        child: TodoList(DataAccess.todos, DataAccess.doneTodos),
      ),
      floatingButtonFunction: () {
        showDialog(
            context: context,
            builder: (context) => CreateTodoDialog(DataAccess.todos));
      },
    );
  }
}
