import 'package:flutter/material.dart';
import 'package:task2login/homepage.dart';
import 'package:task2login/signupage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Login extends StatefulWidget {
    Login({super.key});

  @override

  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override

  Widget build(BuildContext context) {

    return Scaffold(    backgroundColor: Colors.white,

      body: Container( height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),

        child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 300,
                    height: 150,
                    child:Image.asset("images/logo.png")),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),

              child: TextField(



                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email'),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(


                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),

            TextButton(
              onPressed: (){Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Signup()));
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
             child:TextButton(
                onPressed: () async{

                  SharedPreferences prefs = await SharedPreferences.getInstance();




                 Navigator.push(
                     context, MaterialPageRoute(builder: (_) => Homepage()));
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            TextButton(onPressed: (){ Navigator.push(
                context, MaterialPageRoute(builder: (_) => Signup()));},child: Text('New User? Create Account'),)
          ],
        ),
      ),
    );
  }
}


