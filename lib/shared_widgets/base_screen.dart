import 'package:flutter/material.dart';
import 'package:important/modules/finished_todos/finished_todos_screen.dart';
import 'package:important/modules/todos_overview/todos_overview_screen.dart';
import 'package:important/providers/todo_provider.dart';
import 'package:important/shared_widgets/search.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;
  final Function floatingButtonFunction;

  BaseScreen({this.child, this.floatingButtonFunction});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: _appBar(context),
      drawer: _drawer(context),
      body: SingleChildScrollView(
        child: Container(
          width: mediaQuery.size.width,
          height: mediaQuery.size.height * 0.9,
          child: Column(
            children: [
              Container(
                height: mediaQuery.size.height * 0.89,
                child: child,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
        onPressed: floatingButtonFunction,
      ),
    );
  }

  PreferredSizeWidget _appBar(context) {
    final _todoProvider = Provider.of<TodoProvider>(context, listen: false);
    return AppBar(
      title: Text('Important'),
      backgroundColor: Theme.of(context).primaryColor,
      // automaticallyImplyLeading: false,
      actions: [
        SearchButton(_todoProvider.todos),
      ],
    );
  }

  Widget _drawer(context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(child: Text(DateTime.now().toString())),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          ListTile(
            title: Text('Todos'),
            onTap: () =>
                Navigator.pushNamed(context, TodosOverviewScreen.routeName),
          ),
          ListTile(
            title: Text('Finished todos'),
            onTap: () =>
                Navigator.pushNamed(context, FinishedTodosScreen.routeName),
          ),
          ListTile(
            title: Text('About me'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
