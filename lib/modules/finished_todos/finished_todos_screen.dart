import 'package:flutter/material.dart';
import 'package:important/modules/todos_overview/components/create_todo_dialog.dart';
import 'package:important/shared_widgets/base_screen.dart';

import 'components/todo_list.dart';

class FinishedTodosScreen extends StatelessWidget {
  static const routeName = '/finished-todos';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BaseScreen(
      child: Container(
        width: mediaQuery.size.width * 0.95,
        height: mediaQuery.size.height * 8,
        child: TodoList(),
      ),
      floatingButtonFunction: () {
        showDialog(
          context: context,
          builder: (context) => CreateTodoDialog(),
        );
      },
    );
  }
}
