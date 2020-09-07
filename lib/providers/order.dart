import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Orders with ChangeNotifier {
  BuildContext context;
  Future<void> sendFormDetails(
    String name,
    String number,
    String date,
    String time,
    String timeoforder,
  ) {
    final url =
        'https://salonpikassobybraintwopoint0.firebaseio.com/appointments.json';
    {
      try {
        return http.post(
          url,
          body: json.encode(
            {
              'Name': name,
              'Number': number,
              'Date': date,
              'Time': time,
              'DateAndTimeOfOrder': timeoforder,
            },
          ),
        );
      } catch (error) {
        throw error;
      }
    }
  }
}
