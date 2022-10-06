import 'dart:io';

import 'package:flutter/material.dart';
import 'package:starlight/models/hotels.dart';
import 'package:starlight/services/http_reponse.dart';

class HotelsServices extends ChangeNotifier {
  BuildContext? context;
  List<Hotels> hotels = [];
  bool isLoading = true;
  final httpReponse = HttpResponse();
  HotelsServices() {
    _loadHotels();
  }
  void _loadHotels() async {
    await httpReponse.getHttpReponseFromList(
        "hotels.json", Hotels.fromMap, hotels);
    isLoading = false;
    notifyListeners();
  }
}
