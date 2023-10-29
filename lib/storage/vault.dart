import 'package:shared_preferences/shared_preferences.dart';

class Vault {
  static const tokenKey = "authToken";
  final SharedPreferences _storage;

  Vault._(this._storage);

  static Future<Vault> instance() {
    return SharedPreferences.getInstance().then((it) => Vault._(it));
  }

  bool isTokenAccessible() {
    var value = _storage.getString(tokenKey);
    return value != null && value.isNotEmpty;
  }
}
