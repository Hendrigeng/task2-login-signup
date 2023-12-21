import 'package:flutter/material.dart';
import 'dart:async';

import 'package:task2login/pages/homepage.dart';
import 'package:task2login/pages/Loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  bool isLoggedIn = false;
  static const String keylogin="login";
  @override
  void initState() {
    super.initState();
   Timer(Duration(seconds: 5), () {
      _navigateUser();

    });
  }

  void _navigateUser() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

   if(isLoggedIn!=null){
    if(isLoggedIn){

      Navigator.push(
          context, MaterialPageRoute(builder: (_) => Homepage()));
    }else{

      Navigator.push(
          context, MaterialPageRoute(builder: (_) => Login()));

    }}
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
