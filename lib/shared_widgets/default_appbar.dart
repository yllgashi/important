import 'package:flutter/material.dart';
import 'package:important/models/todo.dart';
import 'package:important/Data_access/data_access.dart';
import 'package:important/shared_widgets/search.dart';
import 'package:important/utilities/constants.dart';

class DefaultAppBar extends PreferredSize {
  final List<Todo> _list;

  DefaultAppBar(this._list);
  
  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Text('Important'),
      backgroundColor: Theme.of(context).primaryColor,
      // automaticallyImplyLeading: false,
      actions: [
        SearchButton(_list),
      ],
    );
  }
}
