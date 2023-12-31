import 'package:flutter/material.dart';
import 'dart:async';
import 'package:task2login/pages/homepage.dart';
import 'package:task2login/pages/Loginpage.dart';
import 'package:get_it/get_it.dart';
import '../services/preferences.services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    initSplash();
    super.initState();
  }
  void initSplash() async {

    await Future.delayed(const Duration(seconds: 3));

    //if ( PrefrencesService.checkUser()) {
    if (GetIt.I.get<SharedPreferences>().getBool('isLogin') ?? false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => Homepage()));
      // go to home page
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => Login()));
      // go to login page
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/logo.jpg"), fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("images/Logo2.png"),
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
