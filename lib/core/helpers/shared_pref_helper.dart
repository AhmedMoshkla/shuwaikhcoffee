import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static Future<String?> getSecuredString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> setData(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
}
