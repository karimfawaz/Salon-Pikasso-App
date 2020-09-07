import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class SingleImageScreen extends StatelessWidget {
  static const routeName = '/single-image-screen';
  @override
  Widget build(BuildContext context) {
    final theHeight = MediaQuery.of(context).size.height;
    var imageData = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        floatingActionButton: Padding(
          padding: EdgeInsets.only(top: theHeight * 0.25),
          child: BackButton(
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: Column(children: <Widget>[
          ClipPath(
            clipper: DiagonalPathClipperTwo(),
            child: Container(
              color: Colors.black,
              height: theHeight * 0.25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.photo,
                    color: Colors.white,
                    size: theHeight * 0.05,
                  ),
                  Text(
                    'Album Image',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: theHeight * 0.04),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: theHeight * 0.06,
          ),
          Center(
            child: Hero(tag: imageData, child: Image.asset(imageData)),
          ),
        ]));
  }
}
