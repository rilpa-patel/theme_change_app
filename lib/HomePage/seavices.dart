import 'package:shared_preferences/shared_preferences.dart';

class ColorClass{
Future<void> savecolor(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_theme', theme);
  }

  Future<String> readcolor() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedTheme = prefs.getString('selected_theme') ?? 'White';
    return savedTheme;
  }
}

