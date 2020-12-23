import 'package:flutter/material.dart';

/*

This widget is responsible for the Bag Title
_Zohra&Amal
*/
class BagTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(top: 30, bottom: 7, left: 4),
        width: double.infinity,
        child: Text('My Bag', style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
