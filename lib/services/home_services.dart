import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:starlight/models/home_item.dart';

class HomeServices extends ChangeNotifier {
  final _baseUrl = "starlight-flights-default-rtdb.firebaseio.com";
  HomeItem? homeItem;
  bool isLoading = true;
  HomeServices() {
    loadHome();
  }
  Future<HomeItem> loadHome() async {
    final url = Uri.https(_baseUrl, "home.json");
    final response = await http.get(url);
    final Map<String, dynamic> homeMap = json.decode(response.body);
    homeItem = HomeItem.fromMap(homeMap);
    isLoading = false;
    notifyListeners();
    return homeItem!;
  }
}
