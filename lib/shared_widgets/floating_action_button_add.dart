import 'package:flutter/material.dart';
import 'package:important/models/todo.dart';
import 'package:important/modules/todos_overview/create_todo_dialog.dart';
import 'package:important/utilities/constants.dart';


class FloatingActionButtonAdd extends StatefulWidget {
  final List<Todo> _todos;
  FloatingActionButtonAdd(this._todos);

  @override
  _FloatingActionButtonAddState createState() => _FloatingActionButtonAddState(this._todos);
}

class _FloatingActionButtonAddState extends State<FloatingActionButtonAdd> {
  final List<Todo> _todos;

  _FloatingActionButtonAddState(this._todos);


  @override
  Widget build(BuildContext context) {
    // return FloatingActionButton(
    //   tooltip: 'Add',
    //   child: Icon(Icons.add),
    //   backgroundColor: Theme.of(context).accentColor,
    //   onPressed: () {
    //     showDialog(
    //       context: context,
    //       builder: (context) => CreateTodoDialog(this._todos),
    //     );
    //   },
    // );
  }
}