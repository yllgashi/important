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
        itemCount: todoProvider.todos.length,
        itemBuilder: (context, i) {
          final Todo item = todoProvider.todos[i];

          return Dismissible(
            key: Key(item.caption),
            onDismissed: (DismissDirection dir) {
              if (dir == DismissDirection.startToEnd) {
                setState(() {
                  todoProvider.todos.removeAt(i); // left (remove)
                });
              } else if (dir == DismissDirection.endToStart) {
                setState(() {
                  todoProvider.todos.add(item);
                  // Call setState() function of Done screen
                  todoProvider.todos.removeAt(i); // right (done)
                });
              }
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(dir == DismissDirection.startToEnd
                      ? '"' + item.caption + '" is removed'
                      : '"' + item.caption + '" is moved'),
                  action: SnackBarAction(
                    label: (dir == DismissDirection.startToEnd)
                    ? 'UNDO'
                    : '',
                    onPressed:() {
                      setState(() => todoProvider.todos.insert(i, item));
                    },
                  ),
                ),
              );
            },
            background: Container(
              color: Colors.red,
              child: Icon(
                Icons.delete,
              ),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15),
            ),
            secondaryBackground: Container(
              color: Colors.green,
              child: Icon(
                Icons.tour,
              ),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 15),
            ),
            child: ListItem(todoProvider.todos[i]),
          );
        });
  }
}