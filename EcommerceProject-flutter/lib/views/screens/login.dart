import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/user.dart';
import 'package:flutter_ecommerce_project/services/user_service.dart';
import 'package:flutter_ecommerce_project/views/widgets/rounded_button.dart';
import 'package:flutter_ecommerce_project/views/widgets/rounded_input_field.dart';
import 'package:flutter_ecommerce_project/views/widgets/rounded_password_field.dart';
import 'package:flutter_ecommerce_project/views/screens/registration.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorMessage = "";

  String signin(String email, String password) {
    if (email.isEmpty | password.isEmpty) {
      setState(() {
        errorMessage = "there is an empty field";
      });
    } else {
      final user = UserService().loginUser(email, password);
      user.then((value) {
        if ((value is User)) {
          Navigator.pushNamed(context, "/");
        } else {
          setState(() {
            errorMessage = value;
          });
        }
      });
    }
  }

  void clearError() {
    setState(() {
      errorMessage = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.orange[800],
            Colors.orange[700],
            Colors.orange[300]
          ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 42.0,
                height: 42.0,
                padding: EdgeInsets.only(top: 15, left: 10),
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Sign in",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      (errorMessage != null)
                          ? Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                errorMessage,
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : SizedBox(
                              height: size.height * 0.05,
                            ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            RoundedInputField(
                              hintText: "Your Email",
                              controller: emailController,
                              onChanged: (value) {
                                clearError();
                              },
                            ),
                            RoundedPasswordField(
                              controller: passwordController,
                              onChanged: (value) {
                                clearError();
                              },
                            ),
                            RoundedButton(
                                text: "LOGIN",
                                press: () {
                                  signin(emailController.text,
                                      passwordController.text);
                                }),
                          ],
                        ),
                      ),
                      Text(
                        "Don't have an Account ?",
                        style: TextStyle(color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistartionScreen()),
                          );
                        },
                        child: Text("Sign Up",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
