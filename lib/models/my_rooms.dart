// To parse this JSON data, do
//
//     final myFlights = myFlightsFromMap(jsonString);

import 'dart:convert';
import 'package:starlight/models/rooms.dart';

class MyRooms {
  MyRooms({
    required this.room,
    this.userId,
  });
  String? userId;
  Rooms room;

  factory MyRooms.fromJson(String str, String userId) =>
      MyRooms.fromMap(json.decode(json.decode(str)));

  String toJson() => json.encode(toMap());

  factory MyRooms.fromMap(Map<String, dynamic> json) => MyRooms(
        room: Rooms.fromMap(json),
      );

  Map<String, dynamic> toMap() => {
        userId ?? 'invalid_user': room.toMap(),
      };
}
