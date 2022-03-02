import 'package:flutter/material.dart';
import 'package:rest_countries_app/all_countries/views/homepage.dart';
import 'package:rest_countries_app/const.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Countries App",
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito_Sans',
        backgroundColor: veryLightGray,
        appBarTheme: const AppBarTheme(backgroundColor: veryLightGray),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
              color: veryDarkBlue2, fontWeight: FontWeight.w800, fontSize: 18),
          bodyMedium:
              TextStyle(color: veryDarkBlue2, fontWeight: FontWeight.w600),
          bodySmall:
              TextStyle(color: veryDarkBlue2, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
