part of 'app_theme_bloc.dart';

class AppThemeState extends Equatable {
  const AppThemeState({required this.theme});
  final ThemeData theme;
  @override
  List<Object> get props => [theme];
}