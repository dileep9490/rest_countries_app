part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoaded extends SearchState {
  const SearchLoaded({required this.country});
  final Country country;
  @override
  List<Object> get props => [country];
}

class SearchError extends SearchState {
  final String error;
  const SearchError({required this.error});
  @override
  List<Object> get props => [error];
}
