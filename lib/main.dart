import 'package:flutter/material.dart';
import 'package:task2login/Loginpage.dart';
import 'package:task2login/splashscreen.dart';


void main() {
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