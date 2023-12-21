import 'package:flutter/material.dart';
import 'package:task2login/pages/Loginpage.dart';
import 'package:task2login/pages/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task2login/services/preferences.services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    PrefrencesService.prefs = await SharedPreferences.getInstance();

    if (PrefrencesService.prefs != null) {
      print(
          '========================= prefrences init Successfully ========================');
    }
  } catch (e) {
    print(
        '=========================Error In init Prefrences ${e}========================');
  }
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Splashscreen(),
    );
  }
}