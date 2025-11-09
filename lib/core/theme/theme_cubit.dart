import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  void toggleTheme() =>
      state is ThemeLight ? emit(ThemeDark()) : emit(ThemeLight());

  void setTheme(bool isDark) =>
      state is ThemeLight ? emit(ThemeDark()) : emit(ThemeLight());
}
