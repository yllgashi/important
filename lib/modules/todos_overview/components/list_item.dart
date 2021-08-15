import 'package:flutter/material.dart';
import 'package:important/models/todo.dart';
import '../../../shared_widgets/todo_onlongpress_dialog.dart';
import '../../../shared_widgets/importance_buttons.dart';

class ListItem extends StatelessWidget {
  final Todo _item;
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
