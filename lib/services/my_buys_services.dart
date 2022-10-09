// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:starlight/models/flights.dart';
import 'package:starlight/models/rooms.dart';
import 'package:starlight/models/user.dart';
import 'package:starlight/router/starlight_router.gr.dart';
import 'package:starlight/services/http_reponse.dart';

import '../notifications/cool_alerts.dart';

class MyServices extends ChangeNotifier {
  final storage = const FlutterSecureStorage();
  MyServices() {
    _loadMyFlights();
  }

  final httpReponse = HttpResponse();
  final List<Rooms> rooms = [];
  final List<Flight> flights = [];
  final List<dynamic> _myServices = [];

  List<dynamic> get myServices => _listServices();

  bool isLoading = false;
  Future<bool> buyFlight(
    Flight flight,
    BuildContext context,
  ) async {
    isLoading = true;
    final response = await httpReponse.buyFlightOrRoom(
      flight,
      flights,
    );
    if (response != null) {
      CoolNotifications.onError(context, errorMessage: response);
      return false;
    }
    notifyListeners();
    return true;
  }

  Future<bool> buyRoom(
    Rooms room,
    BuildContext context,
  ) async {
    isLoading = true;
    final response = await httpReponse.buyFlightOrRoom(
      room,
      rooms,
    );
    if (response != null) {
      CoolNotifications.onError(context, errorMessage: response);
      return false;
    }
    notifyListeners();
    // await context.router.replace(const StarLightFlowUser());
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
    await httpReponse.getHttpReponseFromList(path, Flight.fromMap, flights,
        isMyServices: true);
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
    await httpReponse.getHttpReponseFromList(path, Rooms.fromMap, rooms,
        isMyServices: true);
    isLoading = false;
    notifyListeners();
  }

  List<dynamic> _listServices() {
    _myServices.clear();
    _myServices.insertAll(0, rooms);
    _myServices.insertAll(0, flights);
    return _myServices;
  }

  Future<void> deleteServices(dynamic service, BuildContext context) async {
    final String? response = await httpReponse.deleteFlightOrRoom(service);
    if (response != null) {
      CoolNotifications.onError(context, errorMessage: response);
      return;
    }
    if (service is Flight) {
      final flight = flights.firstWhere((element) => element.id == service.id);
      flights.remove(flight);
    } else if (service is Rooms) {
      final room = rooms.firstWhere((element) => element.id == service.id);
      rooms.remove(room);
    }
    notifyListeners();
  }
}
