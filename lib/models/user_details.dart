// To parse this JSON data, do
//
//     final userDetails = userDetailsFromMap(jsonString);

import 'dart:convert';

class UserDetails {
  UserDetails({
    this.gender,
    this.creditCard = 0,
    this.likedHotels,
  });
  String? gender;
  int creditCard;
  Map<String, LikedHotel>? likedHotels;

  factory UserDetails.fromJson(String str) =>
      UserDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserDetails.fromMap(Map<String, dynamic> json) => UserDetails(
        gender: json["gender"],
        creditCard: json["creditCard"],
        likedHotels: json["likedHotels"] == null
            ? null
            : Map.from(json["likedHotels"]).map((k, v) =>
                MapEntry<String, LikedHotel>(k, LikedHotel.fromMap(v))),
      );

  Map<String, dynamic> toMap() => {
        "gender": gender,
        "creditCard": creditCard,
        "likedHotels": likedHotels == null
            ? null
            : Map.from(likedHotels!)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
      };
}

class LikedHotel {
  LikedHotel({
    this.like = false,
  });

  bool like;

  factory LikedHotel.fromJson(String str) =>
      LikedHotel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LikedHotel.fromMap(Map<String, dynamic> json) => LikedHotel(
        like: json["like"] ?? false,
      );

  Map<String, dynamic> toMap() => {
        "like": like,
      };
}
