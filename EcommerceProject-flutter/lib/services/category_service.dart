import 'dart:convert';

import 'package:flutter_ecommerce_project/models/category.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  final String categoryUrl =
      "https://ecommerce-node-junior.herokuapp.com/api/categories";
  List<Category> categories = [];

  Future<List<Category>> getcategories() async {
    dynamic res = await http.get(categoryUrl);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      categories = body.map((dynamic item) => Category.fromJson(item)).toList();
      return categories;
    } else {
      print("can't get categories");
      return [];
    }
  }
}
