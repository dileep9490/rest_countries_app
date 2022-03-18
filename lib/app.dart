import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_countries_app/country_full_info/views/country_full_info_screen.dart';
import 'package:rest_countries_app/search_by_name/views/country_full_info_screen_by_search.dart';


import 'countries_region/views/homepage.dart';

import 'theme/bloc/app_theme_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeBloc, AppThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: "Countries App",
          debugShowCheckedModeBanner: false,
          theme: state.theme,
          initialRoute: HomePage.route,
          routes: {
            HomePage.route: (context) => const HomePage(),
            CountryFullInfoScreen.route: (context) =>
                const CountryFullInfoScreen(),
            SearchCountryFullInfoScreen.route: (context) =>
                const SearchCountryFullInfoScreen()
          },
        );
      },
    );
  }
}
