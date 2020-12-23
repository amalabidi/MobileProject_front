import 'package:flutter/material.dart';

/*

This widget is reponsible for building the item counter to change the quantity
_Zohra&Amal
*/
class ItemCounter extends StatelessWidget {
  final int quantity;
  final Function addQuantity;
  final Function substractQuantity;
  ItemCounter(this.addQuantity, this.quantity, this.substractQuantity);

  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.07,
        child: Row(children: [
          Container(
            margin: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width * 0.07,
            height: MediaQuery.of(context).size.height * 0.04,
            //Minus Button
            child: RaisedButton(
              disabledColor: Colors.grey[300],
              onPressed: quantity > 1 ? substractQuantity : null,
              child: Text(
                '-',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Text(quantity.toString()),
          Container(
            margin: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width * 0.07,
            height: MediaQuery.of(context).size.height * 0.04,
            //Plus Button
            child: RaisedButton(
                onPressed: addQuantity,
                child: Text(
                  '+',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                )),
          ),
        ]));
  }
}
