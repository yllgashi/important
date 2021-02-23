import 'package:flutter/material.dart';
import 'package:important/models/data_access.dart';
import 'package:important/screens/done_todos.dart';
import 'package:important/utilities/constants.dart';
import 'package:important/widgets/search.dart';

class DefaultAppBar extends PreferredSize {
  
  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Text('Important'),
      backgroundColor: Constants.primaryColor,
      actions: [
        SearchButton(DataAccess.todos),
        IconButton(
          icon: Icon(Icons.group_work_outlined),
          onPressed: () => Navigator.push(context, DoneTodos()),
        ),
        IconButton(
          icon: Icon(Icons.alarm_on_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}
