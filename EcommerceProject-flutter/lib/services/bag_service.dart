import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class BagService {
  final String bagUrl = "https://ecommerce-node-junior.herokuapp.com/api/bag";
  List<Product> bag = [];

  Future<List<Product>> getBag() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");

    dynamic res = await http.get("$bagUrl", headers: {"x-auth-token": token});

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      bag = body.map((dynamic item) => Product.fromJson(item)).toList();
      print(bag.length);

      return bag;
    } else {
      print("can't get bag");
      return [];
    }
  }

  Future<void> deleteBagProduct(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    Response res =
        await delete("$bagUrl/$id", headers: {'x-auth-token': token});
    if (res.statusCode == 200) {
      print("Deleted");
    }
  }
Future<void> addToBag(String id) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");

  final response = await http.post(bagUrl,
          headers: {"content-type": "application/json",'x-auth-token': token},
          body: json
              .encode({"id": id}));

        if (response.statusCode == 200) {
          print('added to bag');
        }
}
}