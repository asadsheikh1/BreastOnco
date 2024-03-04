import 'package:shared_preferences/shared_preferences.dart';

class UserCacheData {
  static String? userEmail;
  static String? userId;

  static getCacheData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userEmail = pref.getString('email');
    userId = pref.getString('id');
  }
}
