import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/category.dart';

/* this widget represent a titled and a scrollable list of categories . it's formed by 
 column widget that contains a text widget and a CategoryList widget 
  the constructor parameters are the title of the list and a list of categories   _souheil  */

class TitledCategoryList extends StatelessWidget {
  final String title;
  final List<Category> categoryList;

  TitledCategoryList({this.title, this.categoryList});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 30.0, left: 20),
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
        Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height / 6,
           // child: CategoryList(categoryList))
      )],
    );
  }
}
