import 'package:flutter/material.dart';
import 'package:important/models/ToDoNote.dart';
import 'package:important/models/priority.dart';
import 'package:important/utilities/constants.dart';

  class ImportanceIcons extends StatefulWidget {
    final ToDoNote _item;
    ImportanceIcons(this._item);

    @override
    _ImportanceIconsState createState() => _ImportanceIconsState(this._item);
  }
  
  class _ImportanceIconsState extends State<ImportanceIcons> {
    final ToDoNote _item;
    _ImportanceIconsState(this._item);

    @override
    Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.trip_origin),
          iconSize: 18,
          color: _item.priority == Priority.unimportant
              ? Constants.unimportantColor
              : null,
          onPressed: () {
            setState(() {
              _item.priority = Priority.unimportant;
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.trip_origin),
          iconSize: 18,
          color: _item.priority == Priority.useful ? Constants.usefulColor : null,
          onPressed: () {
            setState(() {
              _item.priority = Priority.useful;
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.trip_origin),
          iconSize: 18,
          color: _item.priority == Priority.fundamental ? Constants.fundamentalColor : null,
          onPressed: () {
            setState(() {
             _item.priority = Priority.fundamental;
            });
          },
        ),
      ],
    );
    }
  }