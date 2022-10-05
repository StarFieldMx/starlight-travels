import 'package:flutter/material.dart';
import 'package:starlight/models/flights.dart';
import 'package:starlight/services/http_reponse.dart';

class FlightsServices extends ChangeNotifier {
  final List<Flights> flights = [];
  bool isLoading = true;
  FlightsServices() {
    loadFlights();
  }
  Future<List<Flights>> loadFlights() async {
    const path = "flights.json";
    final Map<String, dynamic> flightsMap =
        await HttpReponse.getHttpReponse(path);
    flightsMap.forEach((key, value) {
      if (key != "flights-details") {
        final tempFlight = Flights.fromMap(value);
        tempFlight.id = key;
        flights.add(tempFlight);
      }
    });
    print(flights[0].airline);
    return flights;
  }
}
