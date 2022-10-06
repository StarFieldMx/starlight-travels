import 'package:flutter/material.dart';
import 'package:starlight/models/flights.dart';
import 'package:starlight/services/http_reponse.dart';

class FlightsServices extends ChangeNotifier {
  final List<Flights> flights = [];
  final httpReponse = HttpResponse();
  bool isLoading = true;
  FlightsServices() {
    loadFlights();
  }
  Future<List<Flights>> loadFlights() async {
    const path = "flights.json";
    await httpReponse.getHttpReponseFromList(path, Flights.fromMap, flights);
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
