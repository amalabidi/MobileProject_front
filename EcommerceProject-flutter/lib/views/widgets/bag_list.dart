import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import 'package:flutter_ecommerce_project/services/bag_service.dart';
import 'package:flutter_ecommerce_project/views/widgets/bag_item.dart';
import 'package:flutter_ecommerce_project/views/widgets/total.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/*
This class displays the list of Bag items

_Zohra&Amal
*/
class BagList extends StatefulWidget {
  @override
  BagListState createState() => BagListState();
}

class BagListState extends State<BagList> {
  final bagService = BagService();
  bool isFirstTime = true;

  List<Map<String, dynamic>> bagList;
  Future<List<Product>> futurebagList;
  @override
  void initState() {
    futurebagList = bagService.getBag();
  }

  /*This function removes a widget when we click on the  delete button*/
  void remove(id) {
    setState(() {
      bagService.deleteBagProduct(id);
    });
  }

//This function adds 1 to the quantity when we click on the plus button
  void addQuantity(int id) {
    setState(() {
      bagList[id]['quantity'] = bagList[id]['quantity'] + 1;
    });
  }

/*This function substract 1 from the quantity when we click on the minus button*/
  void substractQuantity(int i) {
    setState(() {
      bagList[i]['quantity'] = bagList[i]['quantity'] - 1;
    });
  }

/* Here we build the list */
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futurebagList,
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.hasData) {
            List<Product> products = snapshot.data;
            print(products);

            if (isFirstTime) {
              bagList = products
                  .map((produit) => {'product': produit, 'quantity': 1})
                  .toList();

              isFirstTime = false;
            }
            return Container(
                color: Colors.grey[50],
                child: Column(children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.725,
                      child: ListView.builder(
                          itemCount: bagList.length,
                          itemBuilder: (context, i) {
                            return BagItem(
                              product: bagList[i]['product'],
                              quantity: bagList[i]['quantity'],
                              key: ValueKey(bagList[i]['product'].name),
                              remove: remove,
                              addQuantity: () {
                                addQuantity(i);
                              },
                              substractQuantity: () {
                                substractQuantity(i);
                              },
                            );
                          })),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: Total(bagList ?? []))
                ]));
          } else {
            return Container(
                width: 500,
                child: Align(
                    alignment: Alignment.center,
                    child: Center(
                        child: SpinKitFadingCircle(
                      color: Colors.grey[800],
                      size: 60.0,
                    ))));
          }
        });

    //This is the widget responsible for displaying the total
  }
}
