import 'package:flutter/material.dart';
import 'package:starlight/models/hotels.dart';
import 'package:starlight/models/rooms.dart';
import 'package:starlight/services/http_reponse.dart';

class HotelsServices extends ChangeNotifier {
  BuildContext? context;
  List<Hotel> hotels = [];
  List<Rooms> rooms = [];
  bool isLoading = true;
  final httpReponse = HttpResponse();
  HotelsServices() {
    _loadHotels();
  }
  void _loadHotels() async {
    await httpReponse.getHttpReponseFromList(
        "hotels.json", Hotel.fromMap, hotels);
    await _loadRooms();
    isLoading = false;
    notifyListeners();
  }

  Future<void> _loadRooms() async {
    await httpReponse.getHttpReponseFromList(
        "rooms.json", Rooms.fromMap, rooms);
  }
}
