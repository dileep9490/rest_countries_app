part of 'countries_cubit.dart';

abstract class CountriesState extends Equatable {
  const CountriesState();

  @override
  List<Object> get props => [];
}

class CountriesInitial extends CountriesState {
  final List<Country> countries = [];
  @override
  List<Object> get props => [countries];
}

class CountriesLoading extends CountriesState {
  final List<Country> countries = [];
  @override
  List<Object> get props => [countries];
}

class CountriesLoaded extends CountriesState {
  final List<Country> countries;
  const CountriesLoaded({required this.countries});

  @override
  List<Object> get props => [countries];
}

class CountriesError extends CountriesState {}
