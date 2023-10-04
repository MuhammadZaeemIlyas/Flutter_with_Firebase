import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_flutter/Firebase_auth/firebase_auth_services.dart';
import 'package:firebase_flutter/Widgets/widgets.dart';
import 'package:firebase_flutter/customthings/AppText/Apptext.dart';
import 'package:firebase_flutter/customthings/Colors/colors.dart';
import 'package:firebase_flutter/customthings/Widgets/widgets.dart';
import 'package:flutter/material.dart';

class Emailsignup extends StatefulWidget {
  const Emailsignup({super.key});

  @override
  State<Emailsignup> createState() => _EmailsignupState();
}

bool _obscureText = true;

class _EmailsignupState extends State<Emailsignup> {
  final FirebaseAuthService auth2 = FirebaseAuthService();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: backbutton(backbtn: () {}),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: AppText(
                  text: 'Sign Up',
                  family: 'Pip',
                  weight: FontWeight.bold,
                  size: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Appfield(
                      labelText: 'Your Email',
                    ),
                    Appfield(
                      controller: emailController,
                      labelText: 'Your Age',
                    ),
                    Appfield(
                      controller: passwordController,
                      SuffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _toggle();
                            });
                          },
                          icon: _obscureText == false
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off_sharp)),
                      labelText: 'Password',
                      obscureText: _obscureText,
                    ),
                    Appfield(
                      SuffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _toggle();
                            });
                          },
                          icon: _obscureText == false
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off_sharp)),
                      labelText: 'Confirm Password',
                      obscureText: _obscureText,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: AppButton(
                          onPressed: () {
                            signup();
                          },
                          btntext: 'Sign Up',
                          btntextsize: 18,
                          btncolor: AppColors.black100),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void signup() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    User? user = await auth2.signupwithEmailandPasssword(email, password);
    print('hello $email');
    print('hello $password');

    if (user != null) {
      print('User is created');
    } else {
      print('There is error');
    }
  }
}
