import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:task2login/pages/homepage.dart';
import 'package:task2login/pages/signupage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task2login/services/preferences.services.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  late GlobalKey<FormState> fromKey;

  bool obsecureText = true;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fromKey = GlobalKey<FormState>();
    super.initState();
  }

  void toggleObsecure() {
    obsecureText = !obsecureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 300,
                    height: 150,
                    child: Image.asset("images/logo.png")),
              ),
            ),
            TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(
                  label: Text('Email'),
                  suffixIcon: Icon(Icons.email),

                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'email is required';
                  }

                  if (!EmailValidator.validate(value)) {
                    return 'Not Valid Email';
                  }
                  return null;
                }),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
                obscureText: obsecureText,
                controller: passwordController,
                decoration: InputDecoration(
                    label: const Text('Password'),
                    suffixIcon: InkWell(
                      onTap: () => toggleObsecure(),
                      child: Icon(obsecureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'password is required';
                  }

                  if (value.length < 6) {
                    return 'password too short';
                  }
                  return null;
                }),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
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
                  color: Colors.orange, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async {
                  if (fromKey.currentState?.validate() ?? false) {
                    await PrefrencesService.prefs?.setBool('isLogin', true);

                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => Homepage()));
                  }
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Signup()));
              },
              child: Text('Donot have an account? Register',style: TextStyle(color: Colors.blue, fontSize:12),),
            )
          ],
        ),
      ),
    );
  }
}
