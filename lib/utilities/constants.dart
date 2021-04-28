import 'package:flutter/material.dart';

class Constants {
  // primary colors
  static Color primaryColor = Colors.blueGrey[900];
  static Color accentLightColor = Colors.grey[400];
  static Color accentDarkColor = Colors.grey[300];
  static Color yellowColor = Colors.yellow[800];

  // text colors
  static Color textLightColor = Colors.grey[850];
  static Color textDarkColor = Colors.grey[300];

  // priority colors
  static Color fundamentalColor = Colors.red[900];
  static Color usefulColor = Colors.yellow[700];
  static Color unimportantColor = Colors.blue[600];

  static Function addNewTodo;

  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      primaryColor: primaryColor,
      accentColor: accentLightColor,
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: textLightColor),
      textTheme: TextTheme(
        bodyText1: TextStyle(color: textLightColor),
        bodyText2: TextStyle(color: textLightColor),
        headline4: TextStyle(color: textLightColor, fontSize: 32),
        headline1: TextStyle(color: textLightColor, fontSize: 80),
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      primaryColor: primaryColor,
      accentColor: accentLightColor,
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: textLightColor),
      textTheme: TextTheme(
        bodyText1: TextStyle(color: textLightColor),
        bodyText2: TextStyle(color: textLightColor),
        headline4: TextStyle(color: textLightColor, fontSize: 5),
        headline1: TextStyle(color: textLightColor, fontSize: 32),
      ),
    );
  }
}
