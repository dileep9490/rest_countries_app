import 'package:flutter/material.dart';
import 'package:rest_countries_app/country_full_info/views/country_full_info_screen.dart';
import 'package:rest_countries_app/search_by_name/views/country_full_info_screen_by_search.dart';

import 'countries_region/views/homepage.dart';
import 'const.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Countries App",
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
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (context) => const HomePage(),
        CountryFullInfoScreen.route: (context) => const CountryFullInfoScreen(),
        SearchCountryFullInfoScreen.route: (context) =>
            const SearchCountryFullInfoScreen()
      },
    );
  }
}
