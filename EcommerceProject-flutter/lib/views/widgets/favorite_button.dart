import 'package:flutter/material.dart';

/* this widget a favorite display the favorite button that adds a product to the favorites list of a user 
  it's formed by favorite icon  _souheil */

class FavoriteButton extends StatefulWidget {
   final bool isFav;
   FavoriteButton(this.isFav);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFav ;
  @override
  void initState() {
    isFav = this.widget.isFav;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: IconButton(
          icon: isFav
              ? Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              : Icon(
                  Icons.favorite_outline,
                  color: Colors.black,
                ),
          onPressed: () {
            setState(() {
              isFav = !isFav;
            });
          },
        ));
  }
}
