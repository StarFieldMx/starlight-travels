import 'package:flutter/material.dart';
import 'package:starlight/models/flights.dart';
import 'package:starlight/services/http_reponse.dart';

class FlightsServices extends ChangeNotifier {
  final List<Flight> flights = [];
  final httpReponse = HttpResponse();
  bool isLoading = true;
  FlightsServices() {
    loadFlights();
  }
  Future<void> loadFlights() async {
    const path = "flights.json";
    await httpReponse.getHttpReponseFromList(path, Flight.fromMap, flights);
    isLoading = false;
    notifyListeners();
    // return flights;
  }
}
