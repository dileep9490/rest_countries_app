import 'package:flutter/material.dart';
import 'package:rest_countries_app/all_countries/views/homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Countries App",
      home: const HomePage(),
      theme: ThemeData(fontFamily: 'Nunito_Sans'),
    );
  }
}
