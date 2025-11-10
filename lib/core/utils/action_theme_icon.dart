import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/theme_cubit.dart';

List<Widget> get actionThemeIcon => [
      BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return IconButton(
            icon: Icon(
              state is ThemeLight ? Icons.dark_mode : Icons.light_mode,
            ),
            onPressed: () => context.read<ThemeCubit>().toggleTheme(),
          );
        },
      ),
    ];
