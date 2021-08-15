import 'package:flutter/material.dart';
import 'package:important/models/todo.dart';
import 'package:important/providers/todo_provider.dart';
import 'package:provider/provider.dart';

import 'list_item.dart';

class TodoList extends StatefulWidget {
  TodoList();

  @override
  _TodoList createState() => _TodoList();
}

class _TodoList extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context, listen: true);

    return ListView.builder(
        itemCount: todoProvider.finishedTodos.length,
        itemBuilder: (context, i) {
          final Todo item = todoProvider.finishedTodos[i];

          return Dismissible(
            key: Key(item.caption),
            child: ListItem(todoProvider.finishedTodos[i]),
          );
        });
  }
}
