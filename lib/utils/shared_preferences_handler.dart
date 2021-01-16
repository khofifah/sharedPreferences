import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHandler {
  Future<bool> setCountNumber(int count) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt('count', count);
  }

  Future<int> getCountNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('count');
  }

  Future<bool> setObjectData(String data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('objectData', data);
  }

  Future<String> getObjectData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('objectData');
  }
}
