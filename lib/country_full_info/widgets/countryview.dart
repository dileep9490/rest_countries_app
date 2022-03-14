import 'package:flutter/material.dart';
import 'package:rest_countries_app/country_full_info/widgets/borders_widget.dart';
import 'package:rest_countries_app/country_full_info/widgets/key_value_row_widget.dart';

import '../model/country.dart';
import 'map_row.dart';

class CountryView extends StatelessWidget {
  const CountryView({Key? key, required this.country}) : super(key: key);

  final Country country;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Expanded(child: Image.network(country.flagUrl)),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            country.name,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 24),
          ),
          const SizedBox(
            height: 25,
          ),
          KeyValueRow(rkey: 'Official Name', value: country.officialName),
          const SizedBox(height: 5),
          KeyValueRow(rkey: 'Population', value: country.population.toString()),
          const SizedBox(height: 5),
          KeyValueRow(rkey: 'Region', value: country.region),
          const SizedBox(height: 5),
          KeyValueRow(rkey: 'Sub Region', value: country.subRegion),
          const SizedBox(height: 5),
          KeyValueRow(rkey: 'Capital', value: country.capital[0]),
          const SizedBox(height: 15),
          KeyValueRow(rkey: 'Top Level Domain', value: country.tld[0]),
          const SizedBox(height: 5),
          MapRow(
            rkey: 'currencies',
            map: country.currencies,
          ),
          const SizedBox(height: 5),
          MapRow(rkey: 'languages', map: country.languages),
          const SizedBox(
            height: 25,
          ),
          Borders(borderslist: country.borders)
        ],
      ),
    );
  }
}
