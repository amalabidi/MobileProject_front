import 'package:flutter/material.dart';

import 'package:flutter_ecommerce_project/models/product.dart';
import '../../services/product_service.dart';

// this widget is responsible for building the search item
class SearchItem extends SearchDelegate<Widget> {
  // building the list that contains the product names
  List<String> namelist = List<String>();
  int i = 0;
  List<String> list() {
    // while (i < bagList.length) {
    // namelist.add(bagList[i]['name']);
    i++;
    //}
    return namelist;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    //this button is responsible for clearing the text in the search bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {}

  @override
  Widget buildSuggestions(BuildContext context) {
    final productService = new ProductService();

    return Container(
        child: FutureBuilder(
            future: productService.searchProduct(query),
            builder:
                (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
              if (snapshot.hasData) {
                List<Product> products = snapshot.data;
                return Container(
                    height: (MediaQuery.of(context).size.height / 4) * 1.3,
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 6, left: 6),
                      itemCount: products.length,
                      scrollDirection: Axis.vertical,
                      itemExtent: MediaQuery.of(context).size.width / 10,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, "/product_details_screen",
                                  arguments:
                                      new Product(name: products[index].name));
                            },
                            child: Text(products[index].name));
                      },
                    ));
              } else {
                return Center(child: Text('')
                    //     SpinKitFadingCircle(
                    //   color: Colors.grey[800],
                    //   size: 50.0,
                    // )
                    );
              }
            }));
  }
}
