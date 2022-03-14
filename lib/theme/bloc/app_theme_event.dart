part of 'app_theme_bloc.dart';

class AppThemeEvent extends Equatable {
  final ThemeData theme;
  const AppThemeEvent({required this.theme});

  @override
  List<Object> get props => [theme];
}