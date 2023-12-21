import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task2login/pages/Loginpage.dart';
import 'package:task2login/pages/homepage.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  const SizedBox(height: 60.0),

                  const Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create your account",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  )
                ],
              ),
              Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Username",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),))

                  ),

                  const SizedBox(height: 20),

                  TextField(
                    decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),))

                  ),

                  const SizedBox(height: 20),

                  TextField(
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),))


                  ),

                  const SizedBox(height: 20),

                  TextField(
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),))

                  ),
                ],
              ),
              Container(
                  padding: const EdgeInsets.only(top: 3, left: 3),

                  child:TextButton(
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => Homepage()));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.black
                            , fontSize: 25),
                      )),
              ),


            ],
          ),
        ),


    );
  }
}
