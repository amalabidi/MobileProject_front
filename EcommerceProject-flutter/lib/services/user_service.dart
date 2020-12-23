import 'package:flutter_ecommerce_project/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final String userUrl =
      "https://ecommerce-node-junior.herokuapp.com/api/users";
  final String authUrl = "https://ecommerce-node-junior.herokuapp.com/api/auth";

  dynamic addUser(name, email, password) async {
    try {
      final response = await http.post(userUrl,
          headers: {"content-type": "application/json"},
          body: json
              .encode({"name": name, "email": email, "password": password}));

      final body = jsonDecode(response.body);

      if (body["error"] != null) {
        return body["error"];
      } else {
        if (response.statusCode == 200) {
          User user = User(
              name: body["name"],
              isAdmin: body["isAdmin"],
              token: response.headers["x-auth-token"],
              bag: body["bag"],
              email: body["email"],
              favorite: body["favorite"]);
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("token", user.token);
          return user;
        }
      }
    } catch (e) {
      print(e);
    }
  }

  dynamic loginUser(email, password) async {
    try {
      final response = await http.post(authUrl,
          headers: {"content-type": "application/json"},
          body: json.encode({"email": email, "password": password}));

      final body = jsonDecode(response.body);

      if (body["error"] != null) {
        return body["error"];
      } else {
        if (response.statusCode == 200) {
          User user = User(
              name: body["name"],
              isAdmin: body["isAdmin"],
              token: response.headers["x-auth-token"],
              bag: body["bag"],
              email: body["email"],
              favorite: body["favorite"]);

          final SharedPreferences prefs = await SharedPreferences.getInstance();

          prefs.setString("token", response.headers["x-auth-token"]);
          print(user.token);
          /*prefs.setString("email", user.email);
               prefs.setString("username", user.name);*/
          return user;
        } else {
          throw response.body;
        }
      }
    } catch (e) {
      print(e);
    }
  }

  dynamic updateUser(username, email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    try {
      final response = await http.put("http://192.168.43.68:3001/api/users",
          headers: {"content-type": "application/json", "x-auth-token": token},
          body: json.encode({"email": email, "name": username}));
      final body = jsonDecode(response.body);
      if (body["error"] != null) {
        return body["error"];
      } else {
        if (response.statusCode == 200) {
          User user = User(
              name: body["name"],
              isAdmin: body["isAdmin"],
              token: response.headers["x-auth-token"],
              bag: body["bag"],
              email: body["email"],
              favorite: body["favorite"]);

          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.remove("token");
          prefs.setString("token", response.headers["x-auth-token"]);
          print(user.token);
          return user;
        } else {
          throw response.body;
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
