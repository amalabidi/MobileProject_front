import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/services/user_service.dart';
import 'package:flutter_ecommerce_project/views/widgets/rounded_button.dart';
import 'package:flutter_ecommerce_project/views/widgets/rounded_input_field.dart';
import 'package:flutter_ecommerce_project/views/widgets/rounded_password_field.dart';
import 'package:flutter_ecommerce_project/views/screens/login.dart';
import 'package:flutter_ecommerce_project/models/user.dart';

class RegistartionScreen extends StatefulWidget {
  @override
  _RegistartionScreenState createState() => _RegistartionScreenState();
}

class _RegistartionScreenState extends State<RegistartionScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorMessage = "";
  // this methode add a new user if all the fields are not empty other wise it display an error
  void signup(String username, String email, String password) {
    if (username.isEmpty | email.isEmpty | password.isEmpty) {
      setState(() {
        errorMessage = "there is an empty field";
      });
    } else {
      final result = UserService().addUser(username, email, password);

      result.then((value) {
        print(value);
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
                    "Sign up",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome to our App",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "New",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Account",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30),
                              ),
                            ),
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
                                    height: size.height * 0.01,
                                  ),
                            RoundedInputField(
                              controller: emailController,
                              hintText: "Your Email",
                              onChanged: (value) {
                                clearError();
                              },
                            ),
                            RoundedInputField(
                              controller: usernameController,
                              hintText: "Username",
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
                          ],
                        ),
                      ),
                      RoundedButton(
                          text: "SIGNUP",
                          press: () {
                            signup(usernameController.text,
                                emailController.text, passwordController.text);
                          }),
                      Text(
                        "Already have an Account ?",
                        style: TextStyle(color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text("Sign In",
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
