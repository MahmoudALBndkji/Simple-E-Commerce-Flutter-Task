import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/language_cache_helper.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  static LanguageBloc get(context) => BlocProvider.of(context);

  String selectedLanguage =  isCacheLanguage()
      ? isArabic()
          ? "ar"
          : "en"
      : "ar";
  LanguageBloc() : super(LanguageInitial()) {
    on<LanguageEvent>((event, emit) async {
      switch (event) {
        case ChangeLanguage():
          await blockChangeLanguage(emit, event);
          break;
        case GetSavedLanguage():
          await blockGetSavedLanguage(emit);
          break;
        default:
          break;
      }
    });
  }

  Future<void> blockGetSavedLanguage(Emitter<LanguageState> emit) async {
    final String cachedLanguageCode =
        await LanguageCacheHelper().getCachedLanguageCode();
    emit(ChangeLanguageState(
        locale: Locale(cachedLanguageCode.substring(0, 2))));
  }

  Future<void> blockChangeLanguage(
      Emitter<LanguageState> emit, ChangeLanguage event) async {
    emit(LanguageInitial());
    selectedLanguage = event.languageCode.toString();
    await LanguageCacheHelper().cacheLanguageCode(event.languageCode);
    emit(ChangeLanguageState(locale: Locale(event.languageCode)));
  }
}
