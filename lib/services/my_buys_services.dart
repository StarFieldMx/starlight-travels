import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:starlight/models/flights.dart';
import 'package:starlight/models/rooms.dart';
import 'package:starlight/models/user.dart';
import 'package:starlight/router/starlight_router.gr.dart';
import 'package:starlight/services/http_reponse.dart';

class MyBuysServices extends ChangeNotifier {
  final storage = const FlutterSecureStorage();
  MyBuysServices() {
    _loadMyFlights();
  }

  final httpReponse = HttpResponse();
  final List<Rooms> rooms = [];
  final List<Flight> flights = [];
  final List<dynamic> _myServices = [];

  List<dynamic> get myServices => _listServices();

  bool isLoading = false;
  Future<bool> buyFlight(Flight flight, BuildContext context) async {
    isLoading = true;
    httpReponse.buyFlightOrRoom(flight, flights);
    notifyListeners();
    context.router.replace(const StarLightFlowUser());
    return true;
  }

  Future<bool> buyRoom(Rooms room, BuildContext context) async {
    isLoading = true;
    httpReponse.buyFlightOrRoom(room, rooms);
    notifyListeners();
    context.router.replace(const StarLightFlowUser());
    return true;
  }

  void _loadMyFlights() async {
    isLoading = true;
    String path = "myFlights.json";
    final user = await storage.read(key: 'user');
    if (user != null) {
      final starUser = UserStarlight.fromMap(json.decode(user));
      if (starUser.uid != null) {
        path = "myFlights/${starUser.uid}.json";
      }
    }
    await httpReponse.getHttpReponseFromList(path, Flight.fromMap, flights);
    await _loadMyRooms();
    flights;
    isLoading = false;
    notifyListeners();
  }

  Future<void> _loadMyRooms() async {
    String path = "myRooms.json";
    final user = await storage.read(key: 'user');
    if (user != null) {
      final starUser = UserStarlight.fromMap(json.decode(user));
      if (starUser.uid != null) {
        path = "myRooms/${starUser.uid}.json";
      }
    }
    await httpReponse.getHttpReponseFromList(path, Rooms.fromMap, rooms);
    isLoading = false;
    notifyListeners();
  }

  List<dynamic> _listServices() {
    _myServices.clear();
    _myServices.insertAll(0, rooms);
    _myServices.insertAll(0, flights);
    return _myServices;
  }
}
