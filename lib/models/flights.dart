import 'dart:convert';

List<Flights> flightsFromMap(String str) =>
    List<Flights>.from(json.decode(str).map((x) => Flights.fromMap(x)));

String flightsToMap(List<Flights> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Flights {
  Flights({
    this.airportCode,
    this.airportName,
    this.from,
    this.to,
    this.departure,
    this.arrival,
    this.depTime,
    this.arrTime,
    this.imageUrl,
    this.time,
  });

  String? airportCode;
  String? airportName;
  String? from;
  String? to;
  String? departure;
  String? arrival;
  String? depTime;
  String? arrTime;
  String? imageUrl;
  String? time;

  Flights copyWith({
    String? airportCode,
    String? airportName,
    String? from,
    String? to,
    String? departure,
    String? arrival,
    String? depTime,
    String? arrTime,
    String? imageUrl,
    String? time,
  }) =>
      Flights(
        airportCode: airportCode ?? this.airportCode,
        airportName: airportName ?? this.airportName,
        from: from ?? this.from,
        to: to ?? this.to,
        departure: departure ?? this.departure,
        arrival: arrival ?? this.arrival,
        depTime: depTime ?? this.depTime,
        arrTime: arrTime ?? this.arrTime,
        imageUrl: imageUrl ?? this.imageUrl,
        time: time ?? this.time,
      );

  factory Flights.fromMap(Map<String, dynamic> json) => Flights(
        airportCode: json["AirportCode"],
        airportName: json["AirportName"],
        from: json["from"],
        to: json["to"],
        departure: json["Departure"],
        arrival: json["Arrival"],
        depTime: json["depTime"],
        arrTime: json["arrTime"],
        imageUrl: json["imageUrl"],
        time: json["time"],
      );

  Map<String, dynamic> toMap() => {
        "AirportCode": airportCode,
        "AirportName": airportName,
        "from": from,
        "to": to,
        "Departure": departure,
        "Arrival": arrival,
        "depTime": depTime,
        "arrTime": arrTime,
        "imageUrl": imageUrl,
        "time": time,
      };
}
