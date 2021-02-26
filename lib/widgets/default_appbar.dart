import 'package:flutter/material.dart';
import 'package:important/models/ToDoNote.dart';
import 'package:important/Data_access/data_access.dart';
import 'package:important/utilities/constants.dart';
import 'package:important/widgets/search.dart';

class DefaultAppBar extends PreferredSize {
  final List<ToDoNote> _list;

  DefaultAppBar(this._list);
  
  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Text('Important'),
      backgroundColor: Constants.primaryColor,
      automaticallyImplyLeading: false,
      actions: [
        SearchButton(_list),
        IconButton(
          icon: Icon(Icons.assignment_outlined),
          onPressed: () => Navigator.of(context).pushNamed('/Home'),
        ),
        IconButton(
          icon: Icon(Icons.assistant_photo_outlined),
          onPressed: () => Navigator.of(context).pushNamed('/FinishedTodos'),
        ),
      ],
    );
  }
}
