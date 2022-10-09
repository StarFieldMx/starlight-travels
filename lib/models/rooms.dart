// To parse this JSON data, do
//
//     final rooms = roomsFromMap(jsonString);

import 'dart:convert';

Rooms roomsFromMap(String str) => Rooms.fromMap(json.decode(str));

String roomsToMap(Rooms data) => json.encode(data.toMap());

class Rooms {
  Rooms({
    required this.type,
    required this.price,
    required this.size,
    required this.people,
    required this.pictures,
    required this.beds,
    this.breakfast = false,
    this.parking = false,
    required this.roomAmenities,
    this.id,
  });
  String? id;
  String type;
  int price;
  int size;
  int people;
  List<String> pictures;
  List<Bed> beds;
  bool breakfast;
  bool parking;
  RoomAmenities roomAmenities;

  factory Rooms.fromMap(Map<String, dynamic> json) => Rooms(
        type: json["type"],
        price: json["price"],
        size: json["size"],
        people: json["people"],
        pictures: List<String>.from(json["pictures"].map((x) => x)),
        beds: List<Bed>.from(json["beds"].map((x) => Bed.fromMap(x))),
        breakfast: json["breakfast"],
        parking: json["parking"],
        roomAmenities: RoomAmenities.fromMap(json["roomAmenities"]),
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "price": price,
        "size": size,
        "people": people,
        "pictures": List<dynamic>.from(pictures.map((x) => x)),
        "beds": List<dynamic>.from(beds.map((x) => x.toMap())),
        "breakfast": breakfast,
        "parking": parking,
        "roomAmenities": roomAmenities.toMap(),
      };
}

class Bed {
  Bed({
    required this.amount,
    required this.type,
  });

  int amount;
  String type;

  factory Bed.fromMap(Map<String, dynamic> json) => Bed(
        amount: json["amount"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "amount": amount,
        "type": type,
      };
}

class RoomAmenities {
  RoomAmenities({
    required this.bathroom,
    this.internet = false,
    required this.more,
  });

  Bathroom bathroom;
  bool internet;
  List<More> more;

  factory RoomAmenities.fromMap(Map<String, dynamic> json) => RoomAmenities(
        bathroom: Bathroom.fromMap(json["bathroom"]),
        internet: json["internet"] ?? false,
        more: List<More>.from(json["more"].map((x) => More.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "bathroom": bathroom.toMap(),
        "internet": internet,
        "more": more == null
            ? null
            : List<dynamic>.from(more.map((x) => x.toMap())),
      };
}

class Bathroom {
  Bathroom({
    this.toilets = false,
    this.private = false,
    this.shower = false,
  });

  bool toilets;
  bool private;
  bool shower;

  factory Bathroom.fromMap(Map<String, dynamic> json) => Bathroom(
        toilets: json["toilets"],
        private: json["private"],
        shower: json["shower"],
      );

  Map<String, dynamic> toMap() => {
        "toilets": toilets,
        "private": private,
        "shower": shower,
      };
}

class More {
  More({
    this.housekeeping = false,
    this.wine = false,
    this.food = false,
    this.tvServices = false,
  });

  bool housekeeping;
  bool wine;
  bool food;
  bool tvServices;

  factory More.fromMap(Map<String, dynamic> json) => More(
        housekeeping: json["housekeeping"] ?? false,
        wine: json["wine"] ?? false,
        food: json["food"] ?? false,
        tvServices: json["tv services"] ?? false,
      );

  Map<String, dynamic> toMap() => {
        "housekeeping": housekeeping,
        "wine": wine,
        "food": food,
        "tv services": tvServices,
      };
}
