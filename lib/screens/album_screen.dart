import 'package:flutter/material.dart';
import '../screens/single_image_screen.dart';
import 'package:provider/provider.dart';
import '../providers/album_images.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class AlbumScreen extends StatelessWidget {
  static const routeName = '/album';
  @override
  Widget build(BuildContext context) {
    final imageAlbumScreenData = Provider.of<AlbumImages>(context);
    final theHeight = MediaQuery.of(context).size.height;
    final theWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: theHeight * 0.3),
        child: BackButton(
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: DiagonalPathClipperTwo(),
            child: Container(
              color: Colors.black,
              height: theHeight * 0.30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.photo_album,
                    color: Colors.white,
                    size: theHeight * 0.05,
                  ),
                  Text(
                    'Album',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: theHeight * 0.04),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: theHeight * 0.7,
            child: GridView.builder(
              itemCount: imageAlbumScreenData.images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10, crossAxisCount: 2, crossAxisSpacing: 10),
              itemBuilder: (ctx, index) => Hero(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed(
                          SingleImageScreen.routeName,
                          arguments: imageAlbumScreenData.images[index]),
                      child: Image.asset(
                        imageAlbumScreenData.images[index],
                        fit: BoxFit.fill,
                      )),
                ),
                tag: imageAlbumScreenData.images[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
