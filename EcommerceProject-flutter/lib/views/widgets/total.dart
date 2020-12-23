import 'package:flutter/material.dart';

/*

This widget is responsible for calculating the total price
_Zohra&Amal
*/
class Total extends StatefulWidget {
  final list;

  Total(this.list);
  @override
  _TotalState createState() => _TotalState();
}

class _TotalState extends State<Total> {
  //Calculating the total price
  double calculate() {
    double total = 0;
    setState(() {
      for (int i = 0; i < widget.list.length; i++) {
        total += widget.list[i]['quantity'] * widget.list[i]['product'].price;
      }
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 75, bottom: 10),
      child: Row(children: [
        Text('Total : ', style: TextStyle(fontSize: 18)),
        SizedBox(width: 20),
        Text('\$' + calculate().toString(), style: TextStyle(fontSize: 20)),
        SizedBox(width: 40),
        RaisedButton(
            disabledColor: Colors.grey[300],
            child: Text('Payer', style: TextStyle(fontSize: 15)),
            onPressed: null),
      ]),
    );
  }
}
