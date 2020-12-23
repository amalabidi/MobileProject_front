
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class AddImage extends StatefulWidget {
  final List<String> urls;
  final Function handleDelete;
  final Function handleAddClicked;
  AddImage({this.urls,this.handleDelete,this.handleAddClicked});
  @override
  _State createState() => _State();
}

class _State extends State<AddImage> {

  int limit;
  int _selectedPage = 0;
  List<String> _imagesUrlList = [];

  void initState() {
    super.initState();
    _imagesUrlList = this.widget.urls;
    limit = _imagesUrlList.length;
  

  }

 

  List<Widget> _pageViewChildrenBuilder() {
    return [
      ..._imagesUrlList
          .map(
            (image) => Container(
              child: Image(
                image: NetworkImage(image),
                fit: BoxFit.fill,
                width: 200,
                // height: 250,
              ),
            ),
          )
          .toList(),
    
      GestureDetector(
        onTap: this.widget.handleAddClicked,
        child: Container(
          color: Colors.black12,
          child: Icon(
            FontAwesomeIcons.plus,
          ),
          width: 200,
          height: 250,
        ),
      )
    ];
  }

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
            children: _pageViewChildrenBuilder(),
          ),
          Positioned(
            bottom: 20.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < limit; i++)
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
                  ),
              ],
            ),
          ),
          _selectedPage < limit
              ? Positioned(
                  top: 1,
                  right: 1,
                  child: IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: () => this.widget.handleDelete(_selectedPage)),
                )
              : Container(),
        ],
      ),
    );
  }
}
