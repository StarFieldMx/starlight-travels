import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:starlight/models/flights.dart';
import 'package:http/http.dart' as http;

class FlightsServices extends ChangeNotifier {
  final _baseUrl = "starlight-flights-default-rtdb.firebaseio.com";
  final List<Flights> flights = [];
  bool isLoading = true;
  FlightsServices() {
    loadFlights();
  }
  Future<List<Flights>> loadFlights() async {
    final url = Uri.https(_baseUrl, "flights.json");
    final response = await http.get(url);
    final Map<String, dynamic> flightsMap = json.decode(response.body);
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
