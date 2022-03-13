part of 'country_cubit.dart';

abstract class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object> get props => [];
}

class CountryInitial extends CountryState {
  @override
  List<Object> get props => [];
}

class CountryLoading extends CountryState {
  @override
  List<Object> get props => [];
}

class CountryLoaded extends CountryState {
  const CountryLoaded({required this.country});
  final Country country;
  @override
  List<Object> get props => [country];
}

class CountryError extends CountryState {
  final String error;
  const CountryError({required this.error});
  @override
  List<Object> get props => [];
}
