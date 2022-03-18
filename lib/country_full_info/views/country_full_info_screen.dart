import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_countries_app/country_full_info/cubit/country_cubit.dart';
import 'package:rest_countries_app/widgets/custom_app_bar.dart';

import '../widgets/countryview.dart';

class CountryFullInfoScreen extends StatelessWidget {
  const CountryFullInfoScreen({
    Key? key,
  }) : super(key: key);
  static const String route = 'CountryFullInfoScreen';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
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
          create: (context) => CountryCubit(),
          child: CountryFullInfoView(
            id: args,
          ),
        ));
  }
}

class CountryFullInfoView extends StatelessWidget {
  const CountryFullInfoView({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context) {
    context.read<CountryCubit>().getCountryFullInfo(id: id);
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
                      const Icon(
                        Icons.arrow_back,
                      ),
                      Text(
                        'Back',
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ]),
              ),
            ),
          ),
          Center(child: BlocBuilder<CountryCubit, CountryState>(
            builder: (context, state) {
              if (state is CountryLoading) {
                return const CircularProgressIndicator();
              } else if (state is CountryError) {
                return Column(
                  children: [
                    const Icon(Icons.error),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Error in Loading Data",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                );
              } else if (state is CountryLoaded) {
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
