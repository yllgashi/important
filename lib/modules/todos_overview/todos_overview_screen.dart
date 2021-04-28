import 'package:flutter/material.dart';
import 'package:important/modules/todos_overview/components/create_todo_dialog.dart';
import 'package:important/modules/todos_overview/components/todo_grid_list.dart';
import 'package:important/providers/todo_provider.dart';
import 'package:important/shared_widgets/base_screen.dart';
import 'package:provider/provider.dart';

class TodosOverviewScreen extends StatelessWidget {
  static const routeName = '/todos-overview';

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);
    final mediaQuery = MediaQuery.of(context);
    return BaseScreen(
      child: Container(
        width: mediaQuery.size.width * 0.95,
        height: mediaQuery.size.height * 8,
        child: TodoGridList(),
      ),
      floatingButtonFunction: () {
        showDialog(
          context: context,
          builder: (context) => CreateTodoDialog(todoProvider.todos),
        );
      },
    );
  }
}
