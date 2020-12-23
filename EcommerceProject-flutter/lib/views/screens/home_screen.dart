import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/services/product_service.dart';
import 'package:flutter_ecommerce_project/views/widgets/search_item.dart';
import 'package:flutter_ecommerce_project/views/widgets/category_list.dart';
import 'package:flutter_ecommerce_project/views/widgets/titled_product_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductService productService = new ProductService();
  
  
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        "assets/images/homePage.jpg",
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.3,
        fit: BoxFit.fill,
      ),
      Positioned(
        child: IconButton(
          color: Colors.white,
          iconSize: MediaQuery.of(context).size.width / 13,
          onPressed: () {
            showSearch(context: context, delegate: SearchItem());
          },
          icon: Icon(Icons.search),
        ),
        right: 20,
        top: 45,
      ),
      Positioned(
        child: Text(
          "New Collection",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        top: MediaQuery.of(context).size.height / 5,
        left: 10,
      ),
          Positioned(
        child: Text(
          "The top design trends in 2020",
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
        top: MediaQuery.of(context).size.height / 3.85,
        left: 10,
      ),
      Positioned(
        top: MediaQuery.of(context).size.height / 2.7,
        child: Container(
            height: MediaQuery.of(context).size.height / 1.7,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: SingleChildScrollView(
              child: Column(children: [CategoryList(),
              Container(
                    height: (MediaQuery.of(context).size.height / 4) * 1.8,
                    child: TitledProductList(
                        title: "Best sellers",
                        productList: productService.getProducts()))
              ]),
            )),
      )
    ]);
  }
}
