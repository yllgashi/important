import 'package:flutter/material.dart';
import 'package:important/modules/auth/signup_screen.dart';
import 'package:important/utilities/constants.dart';

import 'components/auth_button.dart';
import 'login_screen.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
              _authImage(mediaQuery),
              SizedBox(height: mediaQuery.size.height * 0.05),
              AuthButton(
                text: 'Login',
                backgroundColor: Theme.of(context).primaryColor,
                textColor: Colors.white,
                mediaQuery: mediaQuery,
                callBack: () => Navigator.pushNamed(
                    context, LoginScreen.routeName),
              ),
              SizedBox(height: mediaQuery.size.height * 0.02),
              AuthButton(
                text: 'Sign up',
                backgroundColor: Theme.of(context).accentColor,
                textColor: Theme.of(context).primaryColor,
                mediaQuery: mediaQuery,
                callBack: () => Navigator.pushNamed(
                    context, SignUpScreen.routeName),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _authImage(MediaQueryData mediaQuery) {
    return Image.asset(
      'assets/images/auth_image.png',
      width: mediaQuery.size.width * 0.5,
    );
  }
}
