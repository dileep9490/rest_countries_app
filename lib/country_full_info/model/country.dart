import 'dart:convert';

class Country {
  final String id;
  final String name;
  final String flagUrl;
  final String officialName;
  final int population;
  final String region;
  final String subRegion;
  final List<String> capital;

  final List<String> tld;
  final Map<String, dynamic> currencies;
  final Map<String, dynamic> languages;
  final List<String> borders;
  Country({
    required this.officialName,
    required this.id,
    required this.name,
    required this.flagUrl,
    required this.population,
    required this.region,
    required this.subRegion,
    required this.capital,
    required this.tld,
    required this.currencies,
    required this.languages,
    required this.borders,
  });

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      id: map['id'] ?? '',
      officialName: map['name']['official'] ?? '',
      name: map['name']['common'] ?? '',
      flagUrl: map['flags']['png'] ?? '',
      population: map['population']?.toInt() ?? 0,
      region: map['region'] ?? '',
      subRegion: map['subRegion'] ?? '',
      capital: List<String>.from(map['capital']),
      tld: List<String>.from(map['tld']),
      currencies: Map<String, dynamic>.from(map['currencies']),
      languages: Map<String, dynamic>.from(map['languages']),
      borders: List<String>.from(map['borders']),
    );
  }

  factory Country.fromJson(String source) =>
      Country.fromMap(json.decode(source));
}
