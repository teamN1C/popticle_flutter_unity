import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('key', 'value');
}

Future<String?> readData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('key');
}
