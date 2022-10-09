// To parse this JSON data, do
//
//     final myFlights = myFlightsFromMap(jsonString);

import 'dart:convert';

import 'package:starlight/models/flights.dart';

class MyFlights {
  MyFlights({
    required this.flight,
    this.userId,
  });
  String? userId;
  Flight flight;

  factory MyFlights.fromJson(String str, String userId) =>
      MyFlights.fromMap(json.decode(json.decode(str)));

  String toJson() => json.encode(toMap());

  factory MyFlights.fromMap(Map<String, dynamic> json) => MyFlights(
        flight: Flight.fromMap(json),
      );

  Map<String, dynamic> toMap() => {
        userId ?? 'invalid_user': flight.toMap(),
      };
}
