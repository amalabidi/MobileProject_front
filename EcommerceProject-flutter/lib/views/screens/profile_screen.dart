import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/views/screens/update_profile_screen.dart';
import 'package:flutter_ecommerce_project/views/widgets/rounded_button.dart';
import 'package:flutter_ecommerce_project/views/widgets/rounded_input_field.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter_ecommerce_project/views/widgets/rounded_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    Size size = MediaQuery.of(context).size;
    Map decodedToken;
    String token;
    return FutureBuilder(
        future: prefs,
        builder:
            (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
          if (snapshot.hasData) {
            token = snapshot.data.getString("token");

            if (token != null) {
              decodedToken = JwtDecoder.decode(token);
            }
          }
          return Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(color: Colors.black87),
              child: Column(children: [
                Container(
                  width: size.width,
                  height: 80,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      shape: BoxShape.rectangle),
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        "User Profile",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                Expanded(
                    child: Container(
                        child: Padding(
                            padding:
                                EdgeInsets.only(top: 80, left: 15, right: 15),
                            child: Column(children: <Widget>[
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "UserName",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 25),
                                          ),
                                        )),
                                    Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 20),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            decodedToken["name"],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                          ),
                                        )),
                                    Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Email",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 25,
                                            ),
                                          ),
                                        )),
                                    Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 20),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            decodedToken["email"],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                          ),
                                        )),
                                    SizedBox(
                                      height: size.height * 0.08,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  child: RoundedButton(
                                text: " EDIT",
                                color: Colors.grey,
                                press: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          UpdateProfile(decodedToken)));
                                },
                              )),
                              Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child: RoundedButton(
                                    text: "SIGN OUT",
                                    color: Colors.black,
                                    press: () async {
                                      final SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.remove("token");
                                      Navigator.pushNamed(context, "/");
                                    },
                                  ))
                            ]))))
              ]));
        });
  }
}
