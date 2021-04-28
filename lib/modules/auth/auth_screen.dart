import 'package:flutter/material.dart';
import 'package:important/utilities/constants.dart';

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
      backgroundColor: Constants.primaryColor,
      body: Container(
        width: double.infinity,
        height: mediaQuery.size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/auth_image.png',
              width: mediaQuery.size.width * 0.5,
            ),
            SizedBox(height: mediaQuery.size.height * 0.05),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: mediaQuery.size.width * 0.5,
                height: mediaQuery.size.height * 0.06,
                color: Colors.yellow[800],
              ),
            ),
            SizedBox(height: mediaQuery.size.height * 0.02),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: mediaQuery.size.width * 0.5,
                height: mediaQuery.size.height * 0.06,
                color: Colors.yellow[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
