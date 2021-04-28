import 'package:flutter/material.dart';
import 'package:important/Data_access/data_access.dart';
import 'package:important/modules/todos_overview/create_todo_dialog.dart';
import 'package:important/shared_widgets/default_appbar.dart';
import 'package:important/shared_widgets/drawer.dart';
import 'package:important/shared_widgets/floating_action_button_add.dart';
import 'package:important/shared_widgets/todo_list.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class TodosOverviewScreen extends StatelessWidget {
  static const routeName = '/todos-overview';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: DefaultAppBar(DataAccess.todos).build(context),
      drawer: DefaultDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: WaveClipperOne(
                flip: true,
              ),
              child: Container(
                height: mediaQuery.size.height * 0.1,
                color: Theme.of(context).primaryColor,
                width: mediaQuery.size.width,
              ),
            ),
            Container(
              width: double.infinity,
              height: mediaQuery.size.height,
              child: TodoList(DataAccess.todos, DataAccess.doneTodos),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => CreateTodoDialog(DataAccess.todos));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        color: Theme.of(context).primaryColor,
        child: Container(
          height: mediaQuery.size.height * 0.07,
          width: mediaQuery.size.width,
        ),
      ),
    );
  }
}
