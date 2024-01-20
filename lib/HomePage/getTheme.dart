import 'package:flutter/material.dart';

class GetthemeValue {
  ThemeData getThemeData(String selectedTheme) {
    if (selectedTheme.toLowerCase() == 'black') {
      return ThemeData.dark().copyWith(
        primaryColor: Colors.black,
      );
    } else if (selectedTheme.toLowerCase() == 'white') {
      return ThemeData.light().copyWith(
        primaryColor: Colors.white,
      );
    } else if (selectedTheme.toLowerCase() == 'red') {
      return ThemeData(
        scaffoldBackgroundColor: Colors.red,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red[300],
        ),
        primaryColor: Colors.red,
        cardTheme: CardTheme(color: Colors.red[400]),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red))),
      );
    } else if (selectedTheme.toLowerCase() == 'blue') {
      return ThemeData(
        scaffoldBackgroundColor: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue[300],
        ),
        primaryColor: Colors.blue,
        cardTheme: CardTheme(color: Colors.blue[400]),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blue))),
      );
    } else if (selectedTheme.toLowerCase() == 'yellow') {
      return ThemeData(
        scaffoldBackgroundColor: Colors.yellow,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.yellow[300],
        ),
        primaryColor: Colors.yellow,
        cardTheme: CardTheme(color: Colors.yellow[400]),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.yellow))),
      );
    } else if (selectedTheme.toLowerCase() == 'green') {
      return ThemeData(
        scaffoldBackgroundColor: Colors.green,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green[300],
        ),
        primaryColor: Colors.green,
        cardTheme: CardTheme(color: Colors.green[400]),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green))),
      );
    }
    return ThemeData.light().copyWith(
      primaryColor: Colors.white,
    );
  }
}
