import 'package:flutter/material.dart';
import 'package:important/models/ToDoNote.dart';
import 'dialogs/todo_onlongpress_dialog.dart';
import 'importance_buttons.dart';

class ListItem extends StatelessWidget {
  final ToDoNote _item;
  ListItem(this._item);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(this._item.caption),
          subtitle: Text(this._item.description),
          trailing: ImportanceIcons(this._item),
          onLongPress: () {
            showDialog(
              context: context,
              builder: (context) => TodoOnlongpressDialog(this._item),
            );
          },
        ),
        Divider()
      ],
    );
  }
}
