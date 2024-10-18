import 'package:shared_preferences/shared_preferences.dart';

class TokenStore {
  static const String bearerTokenKey = 'bearerToken';

  static Future<String?> getBearerToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(bearerTokenKey);
  }

  static Future<void> setBearerToken(String bearerToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(bearerTokenKey, bearerToken);
  }

  static Future<void> removeBearerToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(bearerTokenKey);
  }
}