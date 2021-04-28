import 'package:flutter/material.dart';
import 'package:important/models/todo.dart';
import 'package:important/utilities/constants.dart';

class TodoOnlongpressDialog extends StatelessWidget {
  final Todo _item;
  TodoOnlongpressDialog(this._item);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(this._item.caption),
      content: _contentOfDialog(),
      actions: [
        FlatButton(
          textColor: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('CANCEL'),
        ),
      ],
    );
  }

  Widget _contentOfDialog() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          this._item.description,
        ),
        Divider(height: 10),
        Text(
          this._item.createdDatetime.toString().substring(0, 16),
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}
