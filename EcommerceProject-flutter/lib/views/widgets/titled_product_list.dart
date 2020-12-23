import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:flutter_ecommerce_project/views/widgets/product_list.dart';

/* this widget represent a titled and a scrollable list of products . it's formed by 
 column widget that contains a text widget and a ProductList widget 
  the constructor parameters are the title of the list and a list of products   _souheil  */

class TitledProductList extends StatelessWidget {
 final  Future<List<Product>> productList;
  final String title;
  /*final List<Product> productList;*/

  TitledProductList({this.title, this.productList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
        Container(
            height: (MediaQuery.of(context).size.height / 4) * 1.5,
            child: ProductList(productList))
      ],
    );
  }
}
