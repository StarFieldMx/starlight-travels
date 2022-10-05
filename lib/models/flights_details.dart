// To parse this JSON data, do
//
// final flightDetails = flightDetailsFromMap(jsonString);

import 'dart:convert';

FlightDetails flightDetailsFromMap(String str) =>
    FlightDetails.fromMap(json.decode(str));

String flightDetailsToMap(FlightDetails data) => json.encode(data.toMap());

class FlightDetails {
  FlightDetails({
    required this.id,
    required this.price,
    required this.travelers,
    required this.departure,
    required this.airline,
    required this.flightTime,
    required this.travel,
  });

  String id;
  int price;
  int travelers;
  String departure;
  String airline;
  int flightTime;
  Travel travel;

  factory FlightDetails.fromMap(Map<String, dynamic> json) => FlightDetails(
        id: json["id"],
        price: json["price"],
        travelers: json["travelers"],
        departure: json["Departure"],
        airline: json["Airline"],
        flightTime: json["flightTime"],
        travel: Travel.fromMap(json["travel"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "price": price,
        "travelers": travelers,
        "Departure": departure,
        "Airline": airline,
        "flightTime": flightTime,
        "travel": travel == null ? null : travel.toMap(),
      };
}

class Travel {
  Travel({
    required this.depTime,
    required this.arrTime,
    required this.airportName,
    required this.flightTime,
    required this.airline,
    required this.from,
    required this.to,
  });

  String depTime;
  String arrTime;
  String airportName;
  int flightTime;
  String airline;
  String from;
  String to;

  factory Travel.fromMap(Map<String, dynamic> json) => Travel(
        depTime: json["depTime"],
        arrTime: json["arrTime"],
        airportName: json["AirportName"],
        flightTime: json["flightTime"],
        airline: json["Airline"],
        from: json["from"],
        to: json["to"],
      );

  Map<String, dynamic> toMap() => {
        "depTime": depTime,
        "arrTime": arrTime,
        "AirportName": airportName,
        "flightTime": flightTime,
        "Airline": airline,
        "from": from,
        "to": to,
      };
}
