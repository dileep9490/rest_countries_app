import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

part 'app_theme_event.dart';
part 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc()
      : super(AppThemeState(
          theme: AppTheme.lightTheme,
        )) {
    on<AppThemeEvent>(_onThemeChange);
  }
  _onThemeChange(
    AppThemeEvent event,
    Emitter<AppThemeState> emit,
  ) {
    emit(AppThemeState(theme: event.theme));
  }
}
