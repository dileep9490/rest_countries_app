class Country {
  final String name;
  final int population;
  final List<dynamic> capital;
  final String region;
  final String flagUrl;
  final String id;
  Country({
    required this.name,
    required this.population,
    required this.capital,
    required this.region,
    required this.id,
    required this.flagUrl,
  });

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
        name: map['name']['common'] ?? '',
        population: map['population']?.toInt() ?? 0,
        capital: map['capital'] ?? [],
        region: map['region'] ?? '',
        id: map['cca2'] ?? '',
        flagUrl: map['flags']['png']);
  }
}
