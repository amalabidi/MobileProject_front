import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/views/screens/update_profile_screen.dart';

import 'package:flutter_ecommerce_project/views/widgets/category_filter.dart';

import './views/screens/my_home_page.dart';

import './views/screens/product_details_screen.dart';

import './views/screens/edit_product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MyHomePage(),
        '/edt': (context) => EditProduct(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/product_details_screen': (context) => ProductPage(),
        '/category_filter': (context) => CategoryFilter(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: Scaffold(
      //   body: EditProduct(),
      // ),
    );
  }
}
