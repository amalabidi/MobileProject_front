import 'package:flutter/material.dart';

class ImageSwipe extends StatefulWidget {
  final List<String> urls;
  ImageSwipe(this.urls);

  @override
  _ImageSwipeState createState() => _ImageSwipeState();
}

class _ImageSwipeState extends State<ImageSwipe> {
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: Stack(
        // we used Stack to have the images and the dots ,to show which picture you're on, together
        children: [
          PageView(
            // to swipe and see all images
            onPageChanged: (num) {
              setState(() {
                _selectedPage = num;
              });
            },
            children: [
              for (var i = 1; i < this.widget.urls.length; i++)
                Container(
                  child: Image(
                    image: NetworkImage(this.widget.urls[i]),
                    fit: BoxFit.fitHeight,
                    width: 200,
                    height: 250,
                  ),
                ),
            ],
          ),
          Positioned(
            bottom: 20.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < 5; i++)
                  AnimatedContainer(
                    // Animated Container to have a better visualitation of the dots of every pic
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic,
                    margin: EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    width: _selectedPage == i ? 35.0 : 10.0,
                    height: 12.0,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
