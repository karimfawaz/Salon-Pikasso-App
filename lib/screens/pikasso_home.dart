import 'package:flutter/material.dart';
import './contact_us_screen.dart';
import './appointment_screen.dart';
import './album_screen.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class PikassoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theWidth = MediaQuery.of(context).size.width;
    final theHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: theHeight,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/dark_blue.png'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ClipPath(
                  clipper: WaveClipperOne(),
                  child: Container(
                    color: Colors.black,
                    height: theHeight * 0.35,
                    width: theWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: theWidth * 0.35),
                          child: Image.asset(
                            'assets/logoMain.jpg',
                            height: theHeight * 0.25,
                            width: theHeight * 0.25,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: theWidth * 0.4),
                  child: ClipOval(
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/light_blue.png'),
                              fit: BoxFit.cover)),
                      width: theHeight * 0.2,
                      height: theHeight * 0.2,
                      child: GestureDetector(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Book an Appointment',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: theHeight * 0.03,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Icon(
                              Icons.content_cut,
                              size: theHeight * 0.06,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppointmentScreen.routeName);
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: theWidth * 0.4),
                  child: ClipOval(
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/dark_red.png'),
                              fit: BoxFit.cover)),
                      width: theHeight * 0.2,
                      height: theHeight * 0.2,
                      child: GestureDetector(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Contact Us',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: theHeight * 0.03,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.phone,
                                  size: theHeight * 0.06,
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.location_on,
                                  size: theHeight * 0.06,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(ContactUsScreen.routeName);
                        },
                      ),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipperTwo(reverse: true),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/dark_red.png'),
                            fit: BoxFit.cover)),
                    height: theHeight * 0.25,
                    width: theWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              right: theWidth * 0.4, top: theHeight * 0.03),
                          child: ClipOval(
                            child: Container(
                              // decoration: BoxDecoration(
                              //     image: DecorationImage(
                              //         image: AssetImage('assets/dark_blue.png'),
                              //         fit: BoxFit.cover)),
                              color: Colors.black,
                              width: theHeight * 0.2,
                              height: theHeight * 0.2,
                              child: GestureDetector(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Album',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: theHeight * 0.03,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Icon(
                                      Icons.photo_album,
                                      size: theHeight * 0.06,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(AlbumScreen.routeName);
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
