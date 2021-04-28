import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final MediaQueryData mediaQuery;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final Function callBack;

  AuthButton({
    this.backgroundColor,
    this.callBack,
    this.mediaQuery,
    this.text,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: mediaQuery.size.width * 0.7,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              primary: backgroundColor,
              shadowColor: backgroundColor),
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
          onPressed: callBack,
        ),
      ),
    );
  }
}
