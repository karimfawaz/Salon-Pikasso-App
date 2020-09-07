import 'package:flutter/material.dart';
import '../main.dart';
import '../providers/order_model.dart';
import 'package:provider/provider.dart';
import '../providers/order.dart';

class ThankYouScreen extends StatefulWidget {
  static const routeName = '/thank-you';

  @override
  _ThankYouScreenState createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  @override
  Widget build(BuildContext context) {
    // final orderData = Provider.of<Orders>(context);
    // Order orderParameters = ModalRoute.of(context).settings.arguments;
    // orderData.sendFormDetails(orderParameters.name, orderParameters.number,
    //     orderParameters.date, orderParameters.time, DateTime.now().toString());

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 150,
          ),
          Text(
            'Thank you ! You appointment has been confirmed ! Salah will be waiting for you!',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 30,
          ),
          RaisedButton(
            child: Text(
              'Return to Main Menu',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            color: Colors.blue,
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(Pikasso.routeName);
            },
          )
        ],
      ),
    ));
  }
}
