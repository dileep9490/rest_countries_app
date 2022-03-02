part of 'all_countries_cubit.dart';

abstract class AllCountriesState extends Equatable {
  const AllCountriesState();

  @override
  List<Object> get props => [];
}

class AllCountriesInitial extends AllCountriesState {
  final List<Country> countries = [];
  @override
  List<Object> get props => [countries];
}

class AllCountriesLoading extends AllCountriesState {
  final List<Country> countries = [];
  @override
  List<Object> get props => [countries];
}

class AllCountriesLoaded extends AllCountriesState {
  final List<Country> countries;
  const AllCountriesLoaded({required this.countries});

  @override
  List<Object> get props => [countries];
}

class AllCountriesError extends AllCountriesState {}
