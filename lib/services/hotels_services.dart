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
    _loadRooms();
  }
  void _loadHotels() async {
    await httpReponse.getHttpReponseFromList(
        "hotels.json", Hotel.fromMap, hotels);
    isLoading = false;
    notifyListeners();
  }

  Future<void> _loadRooms() async {
    await httpReponse.getHttpReponseFromList(
        "rooms.json", Rooms.fromMap, rooms);
    rooms;
    notifyListeners();
  }
}
