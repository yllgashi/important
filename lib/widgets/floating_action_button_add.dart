import 'package:flutter/material.dart';
import 'package:important/models/ToDoNote.dart';
import 'package:important/utilities/constants.dart';

import 'create_todo_dialog.dart';

class FloatingActionButtonAdd extends StatefulWidget {
  final List<ToDoNote> _todos;
  FloatingActionButtonAdd(this._todos);

  @override
  _FloatingActionButtonAddState createState() => _FloatingActionButtonAddState(this._todos);
}

class _FloatingActionButtonAddState extends State<FloatingActionButtonAdd> {
  final List<ToDoNote> _todos;

  _FloatingActionButtonAddState(this._todos);


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Add',
      child: Icon(Icons.add),
      backgroundColor: Constants.primaryColor,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => CreateTodoDialog(this._todos),
        );
      },
    );
  }
}