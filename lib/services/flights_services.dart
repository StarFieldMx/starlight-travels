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
  Future<List<Flight>> loadFlights() async {
    const path = "flights.json";
    await httpReponse.getHttpReponseFromList(path, Flight.fromMap, flights);
    flights.forEach(((element) {
      element.from.updateCountry();
      element.to.updateCountry();
    }));
    await Future.delayed(const Duration(seconds: 2));
    isLoading = false;
    notifyListeners();
    return flights;
  }
}
