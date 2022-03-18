import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_countries_app/theme/theme.dart';
import 'package:rest_countries_app/widgets/custom_app_bar.dart';

import '../../const.dart';
import '../cubit/countries_cubit.dart';
import '../models/country.dart';
import '../widgets/country_widget.dart';
import '../widgets/drop_down_menu.dart';
import '../widgets/search_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String route = '/HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(74),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CustomAppBar(),
        ),
      ),
      body: BlocProvider(
        create: (context) => CountriesCubit(),
        child: const HomePageView(),
      ),
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SearchWidget(),
            const DropDownMenu(),
            const SizedBox(
              width: 300,
              child: CountriesListBuilder(),
            )
          ],
        ),
      ),
    );
  }
}

class CountriesListBuilder extends StatelessWidget {
  const CountriesListBuilder({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesCubit, CountriesState>(
        builder: (context, state) {
      if (state is CountriesLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is CountriesError) {
        return const Center(
          child: Expanded(child: Icon(Icons.error)),
        );
      } else if (state is CountriesLoaded) {
        List<Country> countries = state.countries;

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return CountryWidget(country: countries[index]);
          },
          itemCount: countries.length,
        );
      } else {
        return const CircularProgressIndicator();
      }
    });
  }
}
