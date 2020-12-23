import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/category.dart';
import 'package:flutter_ecommerce_project/services/category_service.dart';
import 'package:flutter_ecommerce_project/views/widgets/category_Item.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/* this widget represent a titled and a scrollable list of categories . it's formed by 
 column widget that contains a text widget and a CategoryList widget 
  the constructor parameters are the title of the list and a list of categories   _souheil  */

class CategoryList extends StatelessWidget {
final CategoryService categoryService = new CategoryService();



  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 30.0, left:15 ),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height / 6,
              child: Container(
                  height: MediaQuery.of(context).size.height / 5,
                  child: FutureBuilder(
                      future: categoryService.getcategories(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Category>> snapshot) {
                        if (snapshot.hasData) {
                          List<Category> categories = snapshot.data;

                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemExtent: MediaQuery.of(context).size.width / 4,
                            itemCount: categories.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return CategoryItem(categories[index]);
                            },
                          );
                        } else {
                          return Center(
                            child: SpinKitFadingCircle(
                              color: Colors.grey[800],
                              size: 40.0,
                            ),
                          );
                        }
                      })))
        ]);
  }
}
