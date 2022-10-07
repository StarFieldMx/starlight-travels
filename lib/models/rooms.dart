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
    required this.breakfast,
    required this.parking,
    required this.roomAmenities,
  });

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
    required this.internet,
    required this.more,
  });

  Bathroom bathroom;
  bool internet;
  List<More> more;

  factory RoomAmenities.fromMap(Map<String, dynamic> json) => RoomAmenities(
        bathroom: Bathroom.fromMap(json["bathroom"]),
        internet: json["internet"],
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
    required this.toilets,
    required this.private,
    required this.shower,
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
    required this.housekeeping,
    required this.wine,
  });

  bool housekeeping;
  bool wine;

  factory More.fromMap(Map<String, dynamic> json) => More(
        housekeeping: json["housekeeping"],
        wine: json["wine"],
      );

  Map<String, dynamic> toMap() => {
        "housekeeping": housekeeping,
        "wine": wine,
      };
}
