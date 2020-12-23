import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/product.dart';
import 'package:flutter_ecommerce_project/views/widgets/favorite_button.dart';

/* this widget present the view of a single product .
   it contains a picture of the product , its name and price 
   the constructeur takes as parameter the product that you want to dispaly _souheil  */

class ProductView extends StatefulWidget {
  final Product product;

  //constructor
  ProductView(this.product);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: true,
      onTap: ()  {
     
          Navigator.pushNamed(context, "/product_details_screen",
              arguments: this.widget.product);
        
      },
      onDoubleTap: () {
        //this methode  change  the isFave variable when
        // the product is doubleTaped so that the FavoriteButton change its color
        setState(() {
          isFav = !isFav;
        });
      },
      child: Container(
        width: (MediaQuery.of(context).size.width / 4) * 1.5,
        height: (MediaQuery.of(context).size.height / 4) * 1.5,
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: MediaQuery.of(context).size.width / 2.4,
            height: MediaQuery.of(context).size.width / 2.4,
            child: Container(
              child: Align(
                  alignment: Alignment.topRight, child: FavoriteButton(isFav)),
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: NetworkImage(
                    this.widget.product.imgsUrl[0],
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Text(
            this.widget.product.name,
            style: TextStyle(fontSize: 22, color: Colors.black38),
          ),
          Text(
            "\$${this.widget.product.price} ",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ]),
      ),
    );
  }
}
