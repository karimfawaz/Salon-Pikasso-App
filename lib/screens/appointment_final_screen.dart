import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:provider/provider.dart';
import '../providers/order.dart';
import './order_confirmation_screen.dart';
import 'package:connectivity/connectivity.dart';

class AppointmentFinalScreen extends StatefulWidget {
  final String finaldate;

  final String finaltime;
  AppointmentFinalScreen(this.finaldate, this.finaltime);
  @override
  _AppointmentFinalScreenState createState() =>
      _AppointmentFinalScreenState(this.finaldate, this.finaltime);
}

class _AppointmentFinalScreenState extends State<AppointmentFinalScreen> {
  _AppointmentFinalScreenState(this.finaldate, this.finaltime);
  String name;

  bool isLoading = false;

  String number;

  String finaldate = "No selected date";

  String finaltime = "No selected time";
  static GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    final theHeight = MediaQuery.of(context).size.height;
    final theWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        floatingActionButton: Padding(
          padding: EdgeInsets.only(top: theHeight * 0.25),
          child: BackButton(
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: StreamBuilder<ConnectivityResult>(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              if (!snapshot.hasData ||
                  snapshot.data == ConnectivityResult.none) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Icon(
                        Icons.warning,
                        color: Colors.red,
                        size: theHeight * 0.2,
                      ),
                    ),
                    Text(
                      'YOUR DEVICE IS NOT CONNECTED!',
                      style: TextStyle(fontSize: theHeight * 0.03),
                      textAlign: TextAlign.center,
                    )
                  ],
                );
              } else {
                return isLoading == true
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            ClipPath(
                              clipper: DiagonalPathClipperTwo(),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/light_blue.png'),
                                        fit: BoxFit.cover)),
                                height: theHeight * 0.25,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.content_cut,
                                      color: Colors.white,
                                      size: theHeight * 0.05,
                                    ),
                                    Text(
                                      'Appointments',
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
                              height: theHeight * 0.1,
                            ),
                            Form(
                              key: formKey,
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: 'Name',
                                        hintText: 'Example: Bill Gates'),
                                    validator: (value) =>
                                        value.isEmpty || value.length < 3
                                            ? 'Invalid Name'
                                            : null,
                                    onSaved: (newValue) => name = newValue,
                                  ),
                                  TextFormField(
                                    onSaved: (newValue) => number = newValue,
                                    validator: (value) =>
                                        value.isEmpty || value.length != 8
                                            ? 'Invalid Number'
                                            : null,
                                    decoration: const InputDecoration(
                                      labelText: 'Number',
                                      hintText: 'Example: 03 456 789',
                                    ),
                                    keyboardType: TextInputType.phone,
                                  ),
                                  SizedBox(
                                    height: theHeight * 0.07,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      if (formKey.currentState.validate()) {
                                        formKey.currentState.save();

                                        if (finaldate != 'No selected date' &&
                                            finaltime != 'No selected time') {
                                          setState(() {
                                            isLoading = true;
                                          });
                                        }
                                        if (finaldate != 'No selected date' &&
                                            finaltime != 'No selected time') {
                                          orderData
                                              .sendFormDetails(
                                                  name,
                                                  number,
                                                  finaldate,
                                                  finaltime,
                                                  DateTime.now().toString())
                                              .then((_) {
                                            setState(() {
                                              isLoading = false;
                                            });
                                            Navigator.of(context)
                                                .pushReplacementNamed(
                                              ThankYouScreen.routeName,
                                            );
                                          });
                                        }
                                      }
                                    },
                                    child: ClipOval(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/light_blue.png'),
                                                fit: BoxFit.cover)),
                                        height: theHeight * 0.1,
                                        width: theHeight * 0.1,
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: theHeight * 0.06,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
              }
            }));
  }
}
