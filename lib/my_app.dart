import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/manager/language_cubit.dart';
import 'package:simple_ecommerce_flutter_task/core/theme/theme_cubit.dart';
import 'package:simple_ecommerce_flutter_task/features/splash/views/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit()..setTheme(false),
        ),
        BlocProvider(
          create: (context) => LanguageCubit()..getSavedLanguage(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          if (themeState is ThemeInitial) {
            return const MaterialApp(
              home: Scaffold(
                body: Center(child: CircularProgressIndicator()),
              ),
            );
          }
          final themeData = themeState is ThemeLight
              ? themeState.themeData
              : (themeState as ThemeDark).themeData;
          return BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, langState) {
              Locale currentLocale = const Locale("en");
              if (langState is ChangeLanguageState) {
                currentLocale = langState.locale;
              }
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: "Simple Ecommerce",
                locale: currentLocale,
                supportedLocales: const [
                  Locale("en"),
                  Locale("ar"),
                ],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (Locale locale in supportedLocales) {
                    if (deviceLocale != null &&
                        deviceLocale.languageCode == locale.languageCode) {
                      return deviceLocale;
                    }
                  }
                  return supportedLocales.first;
                },
                theme: themeData,
                themeMode: themeData.brightness == Brightness.light
                    ? ThemeMode.light
                    : ThemeMode.dark,
                home: const SplashView(),
              );
            },
          );
        },
      ),
    );
  }
}
