import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:flutter_ecommerce_project/services/bag_service.dart';
import 'package:flutter_ecommerce_project/services/product_service.dart';
import 'package:flutter_ecommerce_project/views/widgets/favorite_button.dart';
import 'package:flutter_ecommerce_project/views/widgets/item_counter.dart';
import 'package:flutter_ecommerce_project/views/widgets/titled_product_list.dart';

import '../widgets/custom_action_bar.dart';
import '../widgets/image_swiper.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductService productService = new ProductService();
  BagService bagService = new BagService();

  bool _visible = false;
  String _moreInfoText = "MORE INFO ▼";

  void moreInfo() {
    setState(() {
      _visible = !_visible;
    });
    if (_visible == true) {
      setState(() {
        _moreInfoText = "LESS INFO ▲";
      });
    } else {
      setState(() {
        _moreInfoText = "MORE INFO ▼";
      });
    }
  }

  int quantity = 1;

  void addQuantity() {
    setState(() {
      quantity++;
    });
  }

  void substractQuantity() {
    setState(() {
      quantity--;
    });
  }

  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context).settings.arguments;

    /*This function adds 1 to the quantity when we click on the plus button*/

    /*This function substract 1 from the quantity when we click on the minus button*/


    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ListView(children: [
              ImageSwipe(product.imgsUrl),
              Padding(
                padding: const EdgeInsets.only(
                  top: 24.0,
                  left: 24.0,
                  right: 24.0,
                  bottom: 4.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child:
                    //       ItemCounter(addQuantity, quantity, substractQuantity),
                    // )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 24.0,
                ),
                child: Text(
                  "\$" + product.price.toString(),
                  style: TextStyle(
                    color: Colors.red[800],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 24.0,
                  right: 24.0,
                  bottom: 1,
                ),
                child: Text(
                  product.description,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 3,
                  left: 24.0,
                  right: 24.0,
                ),
                child: GestureDetector(
                  onTap: moreInfo,
                  child: Container(
                      width: 100.0,
                      height: 42.0,
                      //alignment: Alignment.topLeft,
                      child: Text(
                        _moreInfoText,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  bottom: 7,
                ),
                child: Visibility(
                  visible: _visible,
                  child: Text(
                    product.moreInfo,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              Container(
                height: (MediaQuery.of(context).size.height / 4) * 1.8,
                child: TitledProductList(
                    title: "YOU MIGHT ALSO LIKE :",
                    productList: productService.getProducts()),
              )
            ]),
            CustomActionBar(
              hasBackArrrow: true,
              hasTitle: false,
              hasBackground: false,
            ),
          ],
        ),
        floatingActionButton: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 24.0,
            ),
            child: FloatingActionButton(
              onPressed: () => bagService
                  .addToBag(product.id)
                  .then((value) => Navigator.pop(context)),
              child: Container(
                height: 65.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Add To Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
