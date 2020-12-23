import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:flutter_ecommerce_project/services/product_service.dart';
import 'package:flutter_ecommerce_project/views/widgets/product_item_admin.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../models/product.dart';

/*
This class displays the list of Products for the administrator
_Zohra&Amal
*/
class AdminPanel extends StatefulWidget {
  @override
  AdminPanelState createState() => AdminPanelState();
}

class AdminPanelState extends State<AdminPanel> {
  ProductService productService = ProductService();

  /*This function removes a widget when we click on the  delete button*/
  void remove(id) {
    setState(() {
      productService.deleteProduct(id);
    });
  }

/* Here we build the list */

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: Column(children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.78,
            child: FutureBuilder(
                future: productService.getProducts(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Product>> snapshot) {
                  if (snapshot.hasData) {
                    List<Product> products = snapshot.data;

                    return ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, i) {
                          return ProductItemAdmin(
                            product: products[i],
                            key: ValueKey(products[i].name),
                            remove: remove,
                          );
                        });
                  } else {
                    return Center(
                        child: SpinKitFadingCircle(
                      color: Colors.grey[800],
                      size: 60.0,
                    ));
                  }
                }))
      ]),
    );
  }
}
