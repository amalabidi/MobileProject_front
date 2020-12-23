import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  void choiceAction(String s) {
    print("working");
  }

  List<String> ch = ["price", "date", "likes"];
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.list_rounded,
        color: Colors.black87,
        size: 40,
      ),
      onSelected: choiceAction,
      itemBuilder: (BuildContext context) {
        return ch.map((String choice) {
          return PopupMenuItem<String>(
              child: new ListTile(
                  leading: Icon(Icons.money), title: Text(choice)));
        }).toList();
      },
    );

    /*Align(
        alignment: Alignment.topRight,
        child: PopupMenuButton<WhyFarther>(
          
            itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
                  const PopupMenuItem<WhyFarther>(
                    value: WhyFarther.harder,
                    child: Text('Working a lot harder'),
                  ),
                  const PopupMenuItem<WhyFarther>(
                    value: WhyFarther.smarter,
                    child: Text('Being a lot smarter'),
                  ),
                  const PopupMenuItem<WhyFarther>(
                    value: WhyFarther.selfStarter,
                    child: Text('Being a self-starter'),
                  ),
                  const PopupMenuItem<WhyFarther>(
                    value: WhyFarther.tradingCharter,
                    child: Text('Placed in charge of trading charter'),
                  ),
                ],
            child: IconButton(
              color: Colors.black87,
              iconSize: 50,
              alignment: Alignment.topRight,
              icon: Icon(
                Icons.list_rounded,
              ),
              onPressed: () {},
            )));*/
  }
}
