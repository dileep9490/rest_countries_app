import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_countries_app/all_countries/widgets/country_widget.dart';

import '../../const.dart';
import '../cubit/countries_cubit.dart';
import '../models/country.dart';
import '../widgets/drop_down_menu.dart';
import '../widgets/search_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(74),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: AppBar(
            title: Text('Where in the world ?',
                style: Theme.of(context).textTheme.bodyLarge),
            shadowColor: veryLightGray,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: GestureDetector(
                  onTap: () {
                    //TODO:implement dark mode
                  },
                  child: Row(children: [
                    const Icon(
                      Icons.dark_mode_outlined,
                      color: veryDarkBlue2,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Dark Mode',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ]),
                ),
              ),
            ],
          ),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SearchWidget(),
            DropDownMenu(),
            SizedBox(
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
