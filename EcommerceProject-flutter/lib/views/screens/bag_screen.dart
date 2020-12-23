import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/views/widgets/bag_title.dart';
import '../widgets/bag_list.dart';

class BagScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       
        //height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(children: [
          BagTitle(),
          Container(
           color: Colors.white,
            padding: EdgeInsets.only(bottom: 0),
            child: BagList(),
          )
        ]),
      ),
    );
  }
}
