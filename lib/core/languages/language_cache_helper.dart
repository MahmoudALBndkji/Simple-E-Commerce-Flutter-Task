import 'package:simple_ecommerce_flutter_task/core/network/local/cache_helper.dart';

class LanguageCacheHelper {
  Future<void> cacheLanguageCode(String languageCode) async =>
      await CacheHelper.instance.write(key: "locale", value: languageCode);

  Future<String> getCachedLanguageCode() async {
    final cachedLanguageCode = await CacheHelper.instance.read(key: "locale");
    return cachedLanguageCode ?? "en";
  }
}
