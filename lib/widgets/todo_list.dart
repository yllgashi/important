import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:important/models/ToDoNote.dart';
import 'package:important/models/priority.dart';
import 'package:important/utilities/constants.dart';
import 'package:important/utilities/temp_values.dart';
import 'package:important/widgets/importance_buttons.dart';
import 'package:important/widgets/todo_onlongpress_dialog.dart';

class TodoList extends StatefulWidget {
  final List<ToDoNote> _todos;

  TodoList(this._todos);

  @override
  _TodoList createState() => _TodoList(this._todos);
}

class _TodoList extends State<TodoList> {
  List<ToDoNote> _todos = [];

  _TodoList(this._todos);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, i) {
          final ToDoNote item = _todos[i];
          if (i.isOdd) return Divider();

          return Dismissible(
            key: Key(item.caption),
            onDismissed: (DismissDirection dir) {
              setState(() => this._todos.removeAt(i));
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(dir == DismissDirection.startToEnd
                      ? item.caption + ' removed'
                      : item.caption + ' is done'),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
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
            child: _listItem(_todos[i]),
          );
        });
  }

  Widget _listItem(ToDoNote item) {
    return ListTile(
      title: Text(item.caption),
      subtitle: Text(item.description),
      trailing: ImportanceIcons(item),
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) => TodoOnlongpressDialog(item),
        );
      },
    );
  }

  void addTodo(ToDoNote item) {
    setState(() {
      this._todos.add(item);
    });
  }
}
