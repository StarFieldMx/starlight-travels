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
    await HttpReponse.getHttpReponseFromList(path, Flights.fromMap, flights);
    notifyListeners();
    return flights;
  }
}
