import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class ContactUsScreen extends StatelessWidget {
  @override
  _launchURL() async {
    const url = 'tel:+961 3884415';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchLocation() async {
    const url =
        'https://www.google.com/maps/dir/33.8785944,35.5110506/salon+pikasso/@33.8798853,35.4945013,15z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x151f176ed6f3c295:0x6630ce180e4e6d5a!2m2!1d35.4965897!2d33.8811721';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static const String routeName = '/contact-Us';
  Widget build(BuildContext context) {
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
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/dark_red.png'),
                      fit: BoxFit.cover)),
              height: theHeight * 0.30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.phone,
                    color: Colors.white,
                    size: theHeight * 0.05,
                  ),
                  Text(
                    'Contact Us',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: theHeight * 0.04),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                _launchURL();
              },
              icon: Icon(
                Icons.phone,
                size: theHeight * 0.08,
                color: Colors.red,
              )),
          SizedBox(
            height: theHeight * 0.05,
          ),
          Text(
            'Contact Number: 03 884 415',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: theHeight * 0.035),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: theHeight * 0.05,
          ),
          IconButton(
              onPressed: () {
                _launchLocation();
              },
              icon: Icon(
                Icons.location_on,
                size: theHeight * 0.08,
                color: Colors.red,
              )),
          SizedBox(
            height: theHeight * 0.05,
          ),
          Text(
            'بيروت، نزلة برج ابي حيدر، مفرق محطة توتال',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: theHeight * 0.03),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: theHeight * 0.05,
          ),
          Text(
            'PLEASE, TAP ON THE BUTTONS TO GET REDIRECTED',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: theHeight * 0.025),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
