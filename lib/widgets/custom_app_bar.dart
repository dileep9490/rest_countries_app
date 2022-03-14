import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_countries_app/theme/bloc/app_theme_bloc.dart';

import '../const.dart';
import '../theme/theme.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    Key? key,
  }) : super(key: key);
  bool _lightTheme = true;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text('Where in the world ?',
          style: Theme.of(context).textTheme.bodyLarge),
      shadowColor: Theme.of(context).backgroundColor,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: () {
              if (_lightTheme) {
                BlocProvider.of<AppThemeBloc>(context)
                    .add(AppThemeEvent(theme: AppTheme.darkTheme));
              } else {
                BlocProvider.of<AppThemeBloc>(context)
                    .add(AppThemeEvent(theme: AppTheme.lightTheme));
              }
              _lightTheme = !_lightTheme;
            },
            child: Row(children: [
              _lightTheme
                  ? const Icon(
                      Icons.dark_mode_outlined,
                      color: veryDarkBlue2,
                    )
                  : const Icon(
                      Icons.dark_mode,
                      color: Colors.white,
                    ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Dark Mode',
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ]),
          ),
        ),
      ],
    );
  }
}
