// To parse this JSON data, do
//
//     final flights = flightsFromMap(jsonString);

import 'dart:convert';

import 'package:starlight/models/country.dart';
import 'package:starlight/models/flights_details.dart';

List<Flight> flightsFromMap(String str) =>
    List<Flight>.from(json.decode(str).map((x) => Flight.fromMap(x)));

String flightsToMap(List<Flight> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Flight {
  Flight({
    this.id,
    required this.airline,
    required this.type,
    required this.from,
    required this.to,
    required this.departure,
    required this.arrival,
    required this.depTime,
    required this.arrTime,
    required this.flighTime,
    required this.price,
    this.details,
  });

  String? id;
  Airline airline;
  Type type;
  Country from;
  Country to;
  String departure;
  String arrival;
  String depTime;
  String arrTime;
  int flighTime;
  int price;
  FlightDetails? details;

  factory Flight.fromMap(Map<String, dynamic> json) => Flight(
        id: json["id"],
        airline: Airline.starlight,
        type: Type.redondo,
        from: json["from"] is String
            ? Country(code: json["from"])
            : Country(code: json["from"]["code"]),
        to: json["to"] is String
            ? Country(code: json["to"])
            : Country(code: json["to"]["code"]),
        departure: json["Departure"],
        arrival: json["Arrival"],
        depTime: json["depTime"],
        arrTime: json["arrTime"],
        flighTime: json["flighTime"],
        price: json["price"],
        details: json["flights_details"] != null
            ? FlightDetails.fromMap(json["flights_details"])
            : null,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "Airline": airline.name,
        "type": type.name,
        "from": from.toMap(),
        "to": to.toMap(),
        "Departure": departure,
        "Arrival": arrival,
        "depTime": depTime,
        "arrTime": arrTime,
        "flighTime": flighTime,
        "price": price,
      };
  factory Flight.fromJson(String str) => Flight.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
}

enum Airline { starlight }

enum Type { redondo }
