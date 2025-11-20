// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }

  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }
}
