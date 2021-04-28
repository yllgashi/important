import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
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
      body: Container(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height * 0.9,
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
              height: mediaQuery.size.height * 0.75,
              child: child,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Add',
          child: Icon(Icons.add),
          backgroundColor: Theme.of(context).accentColor,
          onPressed: floatingButtonFunction),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 3,
        color: Theme.of(context).primaryColor,
        child: Container(
          height: mediaQuery.size.height * 0.07,
          width: mediaQuery.size.width,
        ),
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
            onTap: () {},
          ),
          ListTile(
            title: Text('Finished todos'),
            onTap: () {},
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
