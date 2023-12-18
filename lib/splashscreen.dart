import 'package:flutter/material.dart';
import 'dart:async';

import 'package:task2login/homepage.dart';
import 'package:task2login/Loginpage.dart';
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
        body: Padding(
            padding: EdgeInsets.all(128),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                    child:Image.asset("images/logo.png")),


              ],
            )
        )
    );
  }
}
