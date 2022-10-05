// To parse this JSON data, do
//
//     final flights = flightsFromMap(jsonString);

import 'dart:convert';

import 'package:starlight/models/flights_details.dart';

List<Flights> flightsFromMap(String str) =>
    List<Flights>.from(json.decode(str).map((x) => Flights.fromMap(x)));

String flightsToMap(List<Flights> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Flights {
  Flights({
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
    required this.details,
  });

  String? id;
  Airline airline;
  Type type;
  String from;
  String to;
  String departure;
  String arrival;
  String depTime;
  String arrTime;
  int flighTime;
  int price;
  FlightDetails details;

  factory Flights.fromMap(Map<String, dynamic> json) => Flights(
        id: json["id"],
        airline: Airline.starlight,
        type: Type.redondo,
        from: json["from"],
        to: json["to"],
        departure: json["Departure"],
        arrival: json["Arrival"],
        depTime: json["depTime"],
        arrTime: json["arrTime"],
        flighTime: json["flighTime"],
        price: json["price"],
        details: FlightDetails.fromMap(json["flights_details"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "Airline": airline,
        "type": type,
        "from": from,
        "to": to,
        "Departure": departure,
        "Arrival": arrival,
        "depTime": depTime,
        "arrTime": arrTime,
        "flighTime": flighTime,
        "price": price,
      };
}

enum Airline { starlight }

enum Type { redondo }
