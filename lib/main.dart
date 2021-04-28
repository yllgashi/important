import 'package:flutter/material.dart';
import 'package:important/modules/auth/login_screen.dart';
import 'package:important/providers/todo_provider.dart';
import 'package:important/utilities/constants.dart';
import 'package:provider/provider.dart';

import 'modules/auth/auth_screen.dart';
import 'modules/auth/signup_screen.dart';
import 'modules/todos_overview/todos_overview_screen.dart';

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
        debugShowCheckedModeBanner: false,
        title: 'Important',
        theme: Constants.lightTheme(context),
        darkTheme: Constants.darkTheme(context),
        themeMode: ThemeMode.dark,
        home: AuthScreen(),
        routes: {
          TodosOverviewScreen.routeName: (ctx) => TodosOverviewScreen(),
          // FinishedTodosScreen.routeName: (ctx) => FinishedTodosScreen(),
          AuthScreen.routeName: (ctx) => AuthScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          SignUpScreen.routeName: (ctx) => SignUpScreen(),
        },
      ),
    );
  }
}
