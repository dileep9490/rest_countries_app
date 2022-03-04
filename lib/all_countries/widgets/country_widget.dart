import 'package:flutter/material.dart';
import 'package:rest_countries_app/all_countries/models/country.dart';

class CountryWidget extends StatelessWidget {
  const CountryWidget({Key? key, required this.country}) : super(key: key);

  final Country country;
  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Card(
        child: Column(children: [
          SizedBox(
            height: 170,
            child: Image.network(country.flagUrl),
          ),

          //TODO:seperate subheading and value
          Container(
            height: 160,
            width: 300,
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                country.name,
                style: theme.bodyLarge!
                    .copyWith(fontSize: 20, overflow: TextOverflow.ellipsis),
              ),
              const SizedBox(
                height: 5,
              ),
              //TODO: insert commas between digits
              Text(
                'popultaion:${country.population}',
                style: theme.bodySmall!.copyWith(fontSize: 18),
              ),
              Text(
                'Region : ${country.region}',
                style: theme.bodySmall!.copyWith(fontSize: 18),
              ),
              Text(
                'Capital : ${country.capital.isEmpty ? 'none' : country.capital[0]}',
                style: theme.bodySmall!.copyWith(fontSize: 18),
              )
            ]),
          )
        ]),
      ),
    );
  }
}
