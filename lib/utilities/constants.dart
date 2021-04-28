import 'package:flutter/material.dart';

class Constants {
  // primary colors
  static Color primaryLightColor = Colors.grey[600];
  static Color primaryDarkColor = Colors.grey[700];
  static Color accentLightColor = Colors.grey[100];
  // static Color accentDarkColor = Color(0xFF404040);
  static Color accentDarkColor = Colors.white;
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
      primaryColor: primaryLightColor,
      accentColor: accentLightColor,
      appBarTheme: _appBarTheme(),
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
    return ThemeData.dark().copyWith(
      primaryColor: primaryDarkColor,
      accentColor: accentDarkColor,
      appBarTheme: _appBarTheme(),
      scaffoldBackgroundColor: Colors.grey[900],
      backgroundColor: Colors.grey[850],
      iconTheme: IconThemeData(color: textLightColor),
      textTheme: TextTheme(
        bodyText1: TextStyle(color: textDarkColor),
        bodyText2: TextStyle(color: textDarkColor),
        headline4: TextStyle(color: textDarkColor, fontSize: 5),
        headline1: TextStyle(color: textDarkColor, fontSize: 32),
      ),
    );
  }

  static AppBarTheme _appBarTheme() {
    return AppBarTheme(color: Colors.transparent, elevation: 0);
  }
}
