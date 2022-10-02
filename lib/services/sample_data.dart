import 'package:flutter/material.dart';
import 'package:starlight/models/flights.dart';

class LoadSampleData {
  initDataBase(BuildContext context) async {
    final awa =
        await DefaultAssetBundle.of(context).loadString("assets/trips.json");
    final flights = flightsFromMap(awa);
    print(flights[0]);
  }
}
