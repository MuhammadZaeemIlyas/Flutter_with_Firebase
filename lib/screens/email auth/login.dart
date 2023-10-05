// ignore_for_file: prefer_const_constructors, avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_flutter/Firebase_auth/firebase_auth_services.dart';
import 'package:firebase_flutter/Widgets/widgets.dart';
import 'package:firebase_flutter/customthings/AppText/Apptext.dart';
import 'package:firebase_flutter/customthings/Colors/colors.dart';
import 'package:firebase_flutter/customthings/Widgets/widgets.dart';
import 'package:firebase_flutter/screens/email%20auth/sign_up.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

bool _obscureText = true;

class LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthService auth2 = FirebaseAuthService();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: AppText(
                  text: 'Login',
                  weight: FontWeight.bold,
                  size: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Appfield(
                      controller: emailController,
                      labelText: 'Enter Email',
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
                    Row(
                      children: [
                        AppText(text: 'Create a new  account :'),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Emailsignup()));
                            },
                            child: AppText(text: 'SignUp'))
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: AppButton(
                          onPressed: () async {
                            await proceed();
                            proceed() == true
                                ? GlobalSnackBar.show(
                                    context, 'Please fill all fields')
                                : setState(() {
                                    login();
                                  });

                            if (proceed()) {
                              print('main true hun');
                            } else {
                              print('main false hun');
                            }
                          },
                          btntext: 'Login',
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

  bool proceed() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email == '' || password == '') {
      return true;
    } else {
      return false;
    }
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    User? user;
    if (proceed()) {
      user = await auth2.signInwithEmailandPasssword(email, password);
    }

    print('Email: $email');
    print('Password: $password');

    setState(() {
      print(proceed());
    });

    if (user != null) {
      print('User is created');
      GlobalSnackBar.show(context, 'User created Successfully');
      emailController.clear();

      passwordController.clear();
    } else {
      print('There is error');
    }
  }
}
