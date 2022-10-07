import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:starlight/models/flights.dart';
import 'package:starlight/models/rooms.dart';
import 'package:starlight/router/starlight_router.gr.dart';
import 'package:starlight/services/http_reponse.dart';

class MyBuysServices extends ChangeNotifier {
  MyBuysServices() {
    _loadMyFlights();
  }

  final httpReponse = HttpResponse();
  List<Rooms> rooms = [];
  List<Flight> flights = [];
  bool isLoading = false;
  Future<bool> buyFlight(Flight flight, BuildContext context) async {
    isLoading = true;
    isLoading = await httpReponse.buyFlightOrRoom(flight, flights);
    notifyListeners();
    context.router.replace(const StarLightFlowUser());
    return true;
  }

  Future<bool> buyRoom(Rooms room, BuildContext context) async {
    isLoading = true;
    isLoading = await httpReponse.buyFlightOrRoom(room, rooms);
    notifyListeners();
    context.router.replace(const StarLightFlowUser());
    return true;
  }

  void _loadMyFlights() async {
    isLoading = true;
    const path = "myFlights.json";
    await httpReponse.getHttpReponseFromList(path, Flight.fromMap, flights);
    await _loadMyRooms();
    flights;
    isLoading = false;
    notifyListeners();
  }

  Future<void> _loadMyRooms() async {
    await httpReponse.getHttpReponseFromList(
        "myRooms.json", Rooms.fromMap, rooms);
    isLoading = false;
    notifyListeners();
  }
}
