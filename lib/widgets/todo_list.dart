import 'package:flutter/material.dart';
import 'package:important/models/ToDoNote.dart';
import 'package:important/utilities/constants.dart';
import 'package:important/widgets/list_item.dart';

class TodoList extends StatefulWidget {
  final List<ToDoNote> _todos;
  final List<ToDoNote> _doneTodos;

  TodoList(this._todos, this._doneTodos);

  @override
  _TodoList createState() => _TodoList(this._todos, this._doneTodos);
}

class _TodoList extends State<TodoList> {
  List<ToDoNote> _todos;
  List<ToDoNote> _doneTodos;

  _TodoList(this._todos, this._doneTodos);

  @override
  Widget build(BuildContext context) {
    Constants.addNewTodo =
        addTodo; // storing setState() function outside _TodoList class

    return ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, i) {
          final ToDoNote item = _todos[i];

          return Dismissible(
            key: Key(item.caption),
            onDismissed: (DismissDirection dir) {
              if (dir == DismissDirection.startToEnd) {
                setState(() {
                  this._todos.removeAt(i); // left (remove)
                });
              } else if (dir == DismissDirection.endToStart) {
                setState(() {
                  this._doneTodos.add(item);
                  // Call setState() function of Done screen
                  this._todos.removeAt(i); // right (done)
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
                      setState(() => this._todos.insert(i, item));
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
            child: ListItem(_todos[i]),
          );
        });
  }

  void addTodo(ToDoNote item) {
    this._todos.add(item);
    setState(() {});
  }
}
