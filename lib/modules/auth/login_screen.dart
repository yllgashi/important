import 'package:flutter/material.dart';
import 'package:important/modules/auth/components/auth_button.dart';
import 'package:important/modules/todos_overview/todos_overview_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: mediaQuery.size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _signUpImage(mediaQuery),
              SizedBox(height: mediaQuery.size.height * 0.05),
              _form(mediaQuery: mediaQuery, formKey: _formKey),
              SizedBox(height: mediaQuery.size.height * 0.02),
              AuthButton(
                text: 'Login',
                backgroundColor: Theme.of(context).primaryColor,
                textColor: Colors.white,
                mediaQuery: mediaQuery,
                callBack: () => Navigator.pushReplacementNamed(
                    context, TodosOverviewScreen.routeName),
              ),
              GestureDetector(
                child: Text(
                  'Go to the previous page',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signUpImage(MediaQueryData mediaQuery) {
    return Image.asset(
      'assets/images/book.png',
      width: mediaQuery.size.width * 0.5,
    );
  }

  Widget _form({
    MediaQueryData mediaQuery,
    GlobalKey formKey,
  }) {
    return Form(
      key: _formKey,
      child: Container(
        width: mediaQuery.size.width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                hintText: 'Enter your email',
                labelText: 'Email',
              ),
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                icon: const Icon(Icons.admin_panel_settings_rounded),
                hintText: 'Enter your password',
                labelText: 'Password',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
