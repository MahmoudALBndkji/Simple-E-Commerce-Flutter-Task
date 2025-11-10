part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ThemeLight extends ThemeState {
  final ThemeData themeData;

  ThemeLight()
      : themeData = ThemeData(
          fontFamily: "myFont",
          iconTheme: const IconThemeData(color: Colors.black),
          scaffoldBackgroundColor: Colors.white,
          brightness: Brightness.light,
          primaryColor: const Color(0xFF2196F3),
          colorScheme: ColorScheme.light(
            primary: const Color(0xFF2196F3),
            secondary: const Color(0xFF64B5F6),
            surface: Colors.white,
          ),
          textTheme: TextTheme(
            bodyMedium: TextStyle(color: Colors.black),
          ),
          cardTheme: CardTheme(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF2196F3),
            elevation: 0,
            centerTitle: true,
          ),
        );
}

class ThemeDark extends ThemeState {
  final ThemeData themeData;

  ThemeDark()
      : themeData = ThemeData(
          fontFamily: "myFont",
          iconTheme: const IconThemeData(color: Colors.white),
          scaffoldBackgroundColor: Colors.black,
          brightness: Brightness.dark,
          primaryColor: const Color(0xFF1976D2),
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF1976D2),
            secondary: Color(0xFF64B5F6),
            surface: Color(0xFF1E1E1E),
          ),
          textTheme: TextTheme(
            bodyMedium: TextStyle(color: Colors.white),
          ),
          cardTheme: CardTheme(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: const Color(0xFF1E1E1E),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF121212),
            elevation: 0,
            centerTitle: true,
          ),
        );
}
