import "package:flutter/material.dart";
import './providers/album_images.dart';
import './screens/single_image_screen.dart';
import './screens/pikasso_home.dart';
import './screens/contact_us_screen.dart';
import './screens/appointment_screen.dart';
import './screens/album_screen.dart';
import 'package:provider/provider.dart';
import './providers/order.dart';
import './screens/order_confirmation_screen.dart';

main() {
  runApp(Pikasso());
}

class Pikasso extends StatelessWidget {
  static const routeName = '/main-menu';
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Orders>(create: (_) => Orders()),
        ChangeNotifierProvider<AlbumImages>(create: (_) => AlbumImages()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.red),
        home: PikassoHome(),
        routes: {
          ContactUsScreen.routeName: (ctx) => ContactUsScreen(),
          AppointmentScreen.routeName: (ctx) => AppointmentScreen(),
          AlbumScreen.routeName: (ctx) => AlbumScreen(),
          ThankYouScreen.routeName: (ctx) => ThankYouScreen(),
          Pikasso.routeName: (ctx) => Pikasso(),
          SingleImageScreen.routeName: (ctx) => SingleImageScreen(),
        },
      ),
    );
  }
}
