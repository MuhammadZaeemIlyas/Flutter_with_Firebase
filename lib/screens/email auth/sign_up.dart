// ignore_for_file: prefer_const_constructors, avoid_print

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
  TextEditingController nameController = TextEditingController();
  TextEditingController fathernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
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
        leading: backbutton(
            backbtn: () {
              Navigator.pop(context);
            },
            containercolor: AppColors.black100),
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
                      controller: nameController,
                      labelText: 'Enter Name',
                    ),
                    Appfield(
                      controller: fathernameController,
                      labelText: 'Enter Father Name',
                    ),
                    Appfield(
                      controller: emailController,
                      labelText: 'Enter Email',
                    ),
                    Appfield(
                      controller: ageController,
                      labelText: 'Enter Age',
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
                      controller: confirmpassController,
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
                          onPressed: () async {
                            await checker();
                            await proceed();
                            proceed() == true
                                ? GlobalSnackBar.show(
                                    context, 'Please fill all fields')
                                : setState(() {
                                    signup();
                                    adduser();
                                  });

                            if (proceed()) {
                              print('main true hun');
                            } else {
                              print('main false hun');
                            }
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

  bool proceed() {
    String name = nameController.text.trim();
    print('main name ka checker hon: $name');
    String fathername = fathernameController.text.trim();

    String age = ageController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmpassword = confirmpassController.text.trim();

    if (name == '' ||
        fathername == '' ||
        email == '' ||
        age == '' ||
        password == '' ||
        confirmpassword == '') {
      return true;
    } else {
      return false;
    }
  }

  bool checker() {
    String password = passwordController.text.trim();
    String confirmpassword = confirmpassController.text.trim();

    if (password == confirmpassword) {
      print('password is verified');

      print('hello $password');
      print('confirm password $confirmpassword');
      return true;
    } else {
      print('password is not same');

      return false;
    }
  }

  void signup() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmpassword = confirmpassController.text.trim();

    User? user;
    if (checker()) {
      user = await auth2.signupwithEmailandPasssword(email, password);
    }

    print('Email: $email');
    print('Password: $password');

    setState(() {
      print(checker());
    });

    if (user != null && checker() == true) {
      print('User is created');
      GlobalSnackBar.show(context, 'User created Successfully');
      nameController.clear();
      fathernameController.clear();
      emailController.clear();
      ageController.clear();
      passwordController.clear();
      confirmpassController.clear();
    } else {
      print('There is error');
    }
  }

  void adduser() async {
    String name = nameController.text.trim();
    String fathername = fathernameController.text.trim();
    double age = double.parse(ageController.text.trim());

    await auth2.AddUserDetails(name, fathername, age);
    print('name:$name');
    print('father name:$fathername');
    print('Age : $age');
  }
}
