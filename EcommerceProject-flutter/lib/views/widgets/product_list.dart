import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:flutter_ecommerce_project/views/widgets/Product_View.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/* this widget present a scrolable horizontal list of products .
   it takes a list of productsof and you can add a new 
   Product after instantiation with add category  _ souheil  */

class ProductList extends StatelessWidget {
  final Future<List<Product>> productList;

  // this is a constructor  that takes a list of products and create a list of product_view widgets

  ProductList(this.productList);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
            future: productList,
            builder:
                (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
              if (snapshot.hasData) {
                List<Product> products = snapshot.data;
                return Container(
                    height: (MediaQuery.of(context).size.height / 4) * 1.3,
                    child: ListView.builder(
                      itemCount: products.length,
                      scrollDirection: Axis.horizontal,
                      itemExtent: MediaQuery.of(context).size.width / 2,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return ProductView(products[index]);
                      },
                    ));
              } else {
                return Center(
                    child: SpinKitFadingCircle(
                  color: Colors.grey[800],
                  size: 50.0,
                ));
              }
            }));
  }
}
