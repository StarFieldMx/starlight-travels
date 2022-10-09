// To parse this JSON data, do
//
//     final homeItems = homeItemsFromMap(jsonString);

import 'dart:convert';

HomeItem homeItemsFromMap(String str) => HomeItem.fromMap(json.decode(str));

String homeItemsToMap(HomeItem data) => json.encode(data.toMap());

class HomeItem {
  HomeItem({
    required this.becomeMember,
    required this.nextTrip,
  });

  HomeData becomeMember;
  List<HomeData> nextTrip;

  HomeItem copyWith({
    HomeData? becomeMember,
    List<HomeData>? nextTrip,
  }) =>
      HomeItem(
        becomeMember: becomeMember ?? this.becomeMember,
        nextTrip: nextTrip ?? this.nextTrip,
      );

  factory HomeItem.fromMap(Map<String, dynamic> json) => HomeItem(
        becomeMember: HomeData.fromMap(json["becomeMember"]),
        nextTrip: List<HomeData>.from(
            json["nextTrip"].map((x) => HomeData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "becomeMember": becomeMember.toMap(),
        "nextTrip": nextTrip == null
            ? null
            : List<dynamic>.from(nextTrip.map((x) => x.toMap())),
      };
}

class HomeData {
  HomeData({
    required this.title,
    required this.imageUrl,
    required this.info,
  });

  String title;
  String imageUrl;
  String info;

  HomeData copyWith({
    String? title,
    String? imageUrl,
    String? info,
  }) =>
      HomeData(
        title: title ?? this.title,
        imageUrl: imageUrl ?? this.imageUrl,
        info: info ?? this.info,
      );

  factory HomeData.fromMap(Map<String, dynamic> json) => HomeData(
        title: json["title"],
        imageUrl: json["imageUrl"],
        info: json["info"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "imageUrl": imageUrl,
        "info": info,
      };
}
