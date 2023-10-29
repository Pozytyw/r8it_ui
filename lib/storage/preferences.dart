import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class GlobalPreferences {
  static const localeKey = "locale";
  static const defaultLocale = Locale("en");

  final SharedPreferences _storage;

  GlobalPreferences._(this._storage);

  static Future<GlobalPreferences> instance() {
    return SharedPreferences.getInstance().then((it) => GlobalPreferences._(it));
  }

  Locale getPreferableLocale() {
    var languageCode = _storage.getString(localeKey);
    if (languageCode != null && languageCode.isNotEmpty) {
      return Locale(languageCode);
    }
    return defaultLocale;
  }

  Future<bool> updatePreferableLocale(Locale locale) {
    return _storage.setString(localeKey, locale.languageCode);
  }
}
