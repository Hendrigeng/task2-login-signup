import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task2login/Loginpage.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 70,
      ),

      Container(
        child: Text(
          "  WELCOME  MR ElGHARABAWI",style: TextStyle(color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),

        ),
      ),
      Container(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          width: 400,
          height: 200,
          child: Image.asset("images/logo.png"),
        ),
      ),
      Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(20)),
        child: TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Login()));
            },
            child: Text(
              "back",
              style: TextStyle(color: Colors.white, fontSize: 25),
            )),
      )
    ]);
  }
}
