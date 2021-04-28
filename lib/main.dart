import 'package:flutter/material.dart';
import 'package:important/providers/todo_provider.dart';
import 'package:important/screens/auth/auth_screen.dart';
import 'package:important/screens/finished_todos/finished_todos_screen.dart';
import 'package:important/screens/todos_overview/todos_overview_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => TodoProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Important',
        home: AuthScreen(),
        routes: {
          TodosOverviewScreen.routeName: (ctx) => TodosOverviewScreen(),
          FinishedTodosScreen.routeName: (ctx) => FinishedTodosScreen(),
          AuthScreen.routeName: (ctx) => AuthScreen(),
        },
      ),
    );
  }
}
