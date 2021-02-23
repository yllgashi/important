import 'package:flutter/material.dart';
import 'package:important/widgets/default_appbar.dart';
import 'package:important/widgets/todo_list.dart';

class DoneTodos extends MaterialPageRoute<void> {
  DoneTodos()
      : super(
          builder: (BuildContext context) {
            return Scaffold(
                appBar: DefaultAppBar().build(context),
                // *Note*: use a Builder instead of directly giving the body, so
                // that Scaffold.of(context) won't throw exception, c.f.
                // https://stackoverflow.com/a/51304732.
                body: Container(
                  child: Text('Work'),
                ));
          },
        );
}
