import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:pikasso_app/screens/appointment_final_screen.dart';

class AppointmentScreen extends StatefulWidget {
  static const routeName = '/apointment-screen';

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  String finaldate = "No selected date";
  String finaltime = "No selected time";
  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: DiagonalPathClipperTwo(),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/light_blue.png'),
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
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        elevation: 4.0,
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              theme: DatePickerTheme(
                                containerHeight: 210.0,
                              ),
                              showTitleActions: true,
                              minTime: DateTime.now(),
                              maxTime: DateTime.now().add(Duration(days: 10)),
                              onConfirm: (date) {
                            print('confirm $date');
                            finaldate =
                                '${date.year} - ${date.month} - ${date.day}';
                            setState(() {});
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: theHeight * 0.06,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.date_range,
                                          size: theHeight * 0.03,
                                          color: Colors.teal,
                                        ),
                                        Text(
                                          " $finaldate",
                                          style: TextStyle(
                                              color: Colors.teal,
                                              fontWeight: FontWeight.bold,
                                              fontSize: theHeight * 0.025),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                "  Change",
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: theHeight * 0.025),
                              ),
                            ],
                          ),
                        ),
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: theHeight * 0.03,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        elevation: 4.0,
                        onPressed: () {
                          DatePicker.showTimePicker(
                            context,
                            theme: DatePickerTheme(
                              containerHeight: 210.0,
                            ),
                            showSecondsColumn: false,
                            showTitleActions: true,
                            onConfirm: (time) {
                              print('confirm $time');
                              finaltime = '${time.hour} : ${time.minute}';
                              setState(() {});
                            },
                            currentTime: DateTime.now(),
                          );
                          setState(() {});
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: theHeight * 0.06,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.access_time,
                                          size: theHeight * 0.03,
                                          color: Colors.teal,
                                        ),
                                        Text(
                                          " $finaltime",
                                          style: TextStyle(
                                              color: Colors.teal,
                                              fontWeight: FontWeight.bold,
                                              fontSize: theHeight * 0.025),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                "  Change",
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: theHeight * .025),
                              ),
                            ],
                          ),
                        ),
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: theHeight * 0.07,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (finaldate != 'No selected date' &&
                              finaltime != 'No selected time') {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  AppointmentFinalScreen(finaldate, finaltime),
                            ));
                          }
                        },
                        child: ClipOval(
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/light_blue.png'),
                                    fit: BoxFit.cover)),
                            height: theHeight * 0.1,
                            width: theHeight * 0.1,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: theHeight * 0.06,
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
        ],
      ),
    );
  }
}
