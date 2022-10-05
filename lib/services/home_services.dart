import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:starlight/models/home_item.dart';
import 'package:starlight/services/http_reponse.dart';

class HomeServices extends ChangeNotifier {
  final _baseUrl = "starlight-flights-default-rtdb.firebaseio.com";
  HomeItem? homeItem;
  bool isLoading = true;
  HomeServices() {
    loadHome();
  }
  Future<HomeItem> loadHome() async {
    const path = "home.json";
    final Map<String, dynamic> homeMap = await HttpReponse.getHttpReponse(path);
    homeItem = HomeItem.fromMap(homeMap);
    isLoading = false;
    notifyListeners();
    return homeItem!;
  }
}
