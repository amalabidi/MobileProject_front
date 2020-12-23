import 'package:flutter/material.dart';


class AddDetails extends StatefulWidget {
 final Map product;
 final bool update;
  final Function changedAtrribut;

  AddDetails({this.product, this.changedAtrribut, this.update});

  @override
  _AddDetailsState createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  String category;

  @override
  Widget build(BuildContext context) {
 
    return Container(
      height: 250,
      child: ListView(
        children: [
          TextFormField(
            initialValue: widget.product["name"],
            decoration: InputDecoration(
              labelText: 'Product Name',
            ),
         
            onChanged: (value) => widget.changedAtrribut("name", value),
          ),
          TextFormField(
            initialValue: widget.product["price"].toString(),
            decoration: InputDecoration(
              labelText: 'Price',
            ),
            onChanged: (value) => widget.changedAtrribut("price", value),
          ),
          TextFormField(
            initialValue: widget.product["description"],
            decoration: InputDecoration(
              labelText: 'Description',
            ),
            onChanged: (value) => widget.changedAtrribut("description", value),
          ),
          TextFormField(
            initialValue: widget.product["moreInfo"],
            decoration: InputDecoration(
              labelText: 'More Info',
            ),
            onChanged: (value) => widget.changedAtrribut("moreInfo", value),
          ),
          TextFormField(
            initialValue: widget.product["color"],
            decoration: InputDecoration(
              labelText: 'color',
            ),
            onChanged: (value) => widget.changedAtrribut("color", value),
          ),
          Visibility(
            visible: !widget.update,
            child: TextFormField(
              initialValue: widget.product["category"] ,
                decoration: InputDecoration(
                  labelText: 'Category',
                ),
                    onChanged: (value) {
                  widget.changedAtrribut("category", value);
                }),
          ),
        ],
      ),
    );
  }
}
