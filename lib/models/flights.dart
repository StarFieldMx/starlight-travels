// To parse this JSON data, do
//
//     final flights = flightsFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

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

  Flights copyWith({
    required String id,
    Airline? airline,
    Type? type,
    String? from,
    String? to,
    String? departure,
    String? arrival,
    String? depTime,
    String? arrTime,
    int? flighTime,
    int? price,
  }) =>
      Flights(
        id: id,
        airline: airline ?? this.airline,
        type: type ?? this.type,
        from: from ?? this.from,
        to: to ?? this.to,
        departure: departure ?? this.departure,
        arrival: arrival ?? this.arrival,
        depTime: depTime ?? this.depTime,
        arrTime: arrTime ?? this.arrTime,
        flighTime: flighTime ?? this.flighTime,
        price: price ?? this.price,
      );

  factory Flights.fromMap(Map<String, dynamic> json) => Flights(
        id: json["id"],
        airline: Airline.VIVA_AEROBUS,
        type: Type.REDONDO,
        from: json["from"],
        to: json["to"],
        departure: json["Departure"],
        arrival: json["Arrival"],
        depTime: json["depTime"],
        arrTime: json["arrTime"],
        flighTime: json["flighTime"],
        price: json["price"],
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

enum Airline { VIVA_AEROBUS }

enum Type { REDONDO }
