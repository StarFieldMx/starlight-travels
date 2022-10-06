import 'package:flutter/material.dart';
import 'package:starlight/models/hotels.dart';
import 'package:starlight/services/http_reponse.dart';

class HotelsServices extends ChangeNotifier {
  BuildContext? context;
  List<Hotel> hotels = [];
  bool isLoading = true;
  final httpReponse = HttpResponse();
  HotelsServices() {
    _loadHotels();
  }
  void _loadHotels() async {
    await httpReponse.getHttpReponseFromList(
        "hotels.json", Hotel.fromMap, hotels);
    isLoading = false;
    notifyListeners();
  }
}
