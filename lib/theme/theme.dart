import 'package:flutter/material.dart';

import '../const.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Nunito_Sans',
    backgroundColor: veryLightGray,
    appBarTheme: const AppBarTheme(backgroundColor: veryLightGray),
    iconTheme: const IconThemeData(color: Colors.black),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          color: veryDarkBlue2, fontWeight: FontWeight.w800, fontSize: 18),
      bodyMedium: TextStyle(color: veryDarkBlue2, fontWeight: FontWeight.w600),
      bodySmall: TextStyle(color: veryDarkBlue2, fontWeight: FontWeight.w300),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Nunito_Sans',
    backgroundColor: veryDarkBlue,
    cardColor: darkBlue,
    appBarTheme: const AppBarTheme(backgroundColor: veryDarkBlue),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      bodyLarge:
          TextStyle(color: white, fontWeight: FontWeight.w800, fontSize: 18),
      bodyMedium: TextStyle(color: white, fontWeight: FontWeight.w600),
      bodySmall: TextStyle(color: white, fontWeight: FontWeight.w300),
    ),
  );
}
