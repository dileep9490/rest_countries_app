import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_countries_app/country_full_info/cubit/country_cubit.dart';
import 'package:rest_countries_app/search_by_name/cubit/search_cubit.dart';

import '../../const.dart';
import '../../country_full_info/widgets/countryview.dart';

class SearchCountryFullInfoScreen extends StatelessWidget {
  const SearchCountryFullInfoScreen({
    Key? key,
  }) : super(key: key);
  static const String route = 'SearchCountryFullInfoScreen';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(74),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: AppBar(
              automaticallyImplyLeading: false,
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
          create: (context) => SearchCubit(),
          child: CountryFullInfoView(
            name: args,
          ),
        ));
  }
}

class CountryFullInfoView extends StatelessWidget {
  const CountryFullInfoView({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    context.read<SearchCubit>().searchName(countryName: name);
    return Container(
      margin: const EdgeInsets.only(left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Card(
              elevation: 3,
              margin: const EdgeInsets.only(top: 40),
              child: SizedBox(
                width: 100,
                height: 40,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.arrow_back),
                      Text(
                        'Back',
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ]),
              ),
            ),
          ),
          Center(child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchLoading) {
                return const CircularProgressIndicator();
              } else if (state is SearchError) {
                return Center(child: Text(state.error));
              } else if (state is SearchLoaded) {
                return CountryView(country: state.country);
              } else {
                return const CircularProgressIndicator();
              }
            },
          )),
        ],
      ),
    );
  }
}
