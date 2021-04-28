import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:important/models/todo.dart';
import 'package:important/models/priority.dart';
import 'package:important/utilities/constants.dart';

class CreateTodoDialog extends StatefulWidget {
  final List<Todo> _todos;

  CreateTodoDialog(this._todos);

  @override
  _CreateTodoDialogState createState() => _CreateTodoDialogState(this._todos);
}

class _CreateTodoDialogState extends State<CreateTodoDialog> {
  final List<Todo> _todos;
  final _todoTitleController = TextEditingController();
  final _todoDescriptionController = TextEditingController();

  _CreateTodoDialogState(this._todos);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text('New todo'),
      content: _todoForm(),
      actions: [
        TextButton(
          style: TextButton.styleFrom(primary: Theme.of(context).primaryColor),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        TextButton(
          style: TextButton.styleFrom(primary: Theme.of(context).primaryColor),
          onPressed: addNewTodo,
          child: Text('Create'),
        ),
      ],
    );
  }

  Widget _todoForm() {
    final node = FocusScope.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          autofocus: true,
          onEditingComplete: () => node.nextFocus(),
          textInputAction: TextInputAction.next,
          controller: _todoTitleController,
          maxLength: 50,
          keyboardType: TextInputType.text,
          style: Theme.of(context).textTheme.headline6,
          decoration: InputDecoration(
            icon: const Icon(Icons.bookmarks_outlined),
            labelText: 'Title',
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
        ),
        Divider(height: 15),
        TextField(
          controller: _todoDescriptionController,
          maxLength: 100,
          onEditingComplete: addNewTodo,
          keyboardType: TextInputType.text,
          style: Theme.of(context).textTheme.subtitle1,
          decoration: InputDecoration(
            icon: const Icon(Icons.description_outlined),
            labelText: 'Description',
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
        )
      ],
    );
  }

  void addNewTodo() {
    Todo temp = Todo(
      caption: this._todoTitleController.text,
      description: this._todoDescriptionController.text,
      priority: Priority.unimportant,
      createdDatetime: DateTime.now(),
    );
    Constants.addNewTodo(temp);
    Navigator.pop(context);
  }
}
