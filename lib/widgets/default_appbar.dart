import 'package:flutter/material.dart';
import 'package:important/models/data_access.dart';
import 'package:important/utilities/constants.dart';
import 'package:important/widgets/search.dart';

class DefaultAppBar extends PreferredSize {
  
  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Text('Important'),
      backgroundColor: Constants.primaryColor,
      automaticallyImplyLeading: false,
      actions: [
        SearchButton(DataAccess.todos),
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
