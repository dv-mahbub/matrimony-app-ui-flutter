import 'package:shared_preferences/shared_preferences.dart';

class OnboardController {
  static const String onboardKey = 'onboardingControl';

  static Future<bool> getOnboardStatus() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(onboardKey) == null) {
      return false;
    } else {
      return prefs.getBool(onboardKey) ?? false;
    }
  }

  static Future<void> setOnboardStatus(bool onboardStatus) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(onboardKey, onboardStatus);
  }

  static Future<void> removeOnboardStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(onboardKey);
  }
}
