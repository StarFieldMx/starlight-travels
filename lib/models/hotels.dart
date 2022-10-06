// To parse this JSON data, do
//
//     final hotels = hotelsFromMap(jsonString);

import 'dart:convert';

List<Hotel> hotelsFromMap(String str) =>
    List<Hotel>.from(json.decode(str).map((x) => Hotel.fromMap(x)));

String hotelsToMap(List<Hotel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Hotel {
  Hotel({
    this.id,
    this.picture,
    required this.hotel,
    required this.rate,
    required this.direction,
    required this.amenties,
    required this.internet,
    required this.foodDrink,
    required this.thingsToDo,
    required this.accessibility,
    required this.more,
  });
  String? id;
  String? picture;
  String hotel;
  double rate;
  Direction direction;
  Amenties amenties;
  List<Internet> internet;
  FoodDrink foodDrink;
  List<More> thingsToDo;
  Accessibility accessibility;
  List<More> more;

  factory Hotel.fromMap(Map<String, dynamic> json) => Hotel(
        picture: json["picture"],
        hotel: json["hotel"],
        rate: json["rate"].toDouble(),
        direction: Direction.fromMap(json["direction"]),
        amenties: Amenties.fromMap(json["amenties"]),
        internet: List<Internet>.from(
            json["internet"].map((x) => Internet.fromMap(x))),
        foodDrink: FoodDrink.fromMap(json["foodDrink"]),
        thingsToDo:
            List<More>.from(json["thingsToDo"].map((x) => More.fromMap(x))),
        accessibility: Accessibility.fromMap(json["accessibility"]),
        more: List<More>.from(json["more"].map((x) => More.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "picture": picture,
        "hotel": hotel,
        "rate": rate,
        "direction": direction.toMap(),
        "amenties": amenties.toMap(),
        "internet": List<dynamic>.from(internet.map((x) => x.toMap())),
        "foodDrink": foodDrink.toMap(),
        "thingsToDo": thingsToDo == null
            ? null
            : List<dynamic>.from(thingsToDo.map((x) => x.toMap())),
        "accessibility": List<dynamic>.from(more.map((x) => x.toMap())),
      };
}

class Accessibility {
  Accessibility({
    required this.elevator,
    required this.ramps,
  });

  bool elevator;
  bool ramps;

  factory Accessibility.fromMap(Map<String, dynamic> json) => Accessibility(
        elevator: json["elevator"],
        ramps: json["ramps"],
      );

  Map<String, dynamic> toMap() => {
        "elevator": elevator,
        "ramps": ramps,
      };
}

class Amenties {
  Amenties({
    required this.internet,
    required this.pool,
    required this.air,
    required this.pet,
    required this.parking,
    required this.breakfast,
    required this.restaurant,
    required this.bar,
    required this.housekeeping,
    required this.frontDesk,
  });

  bool internet;
  bool pool;
  bool air;
  bool pet;
  bool parking;
  bool breakfast;
  bool restaurant;
  bool bar;
  bool housekeeping;
  bool frontDesk;

  factory Amenties.fromMap(Map<String, dynamic> json) => Amenties(
        internet: json["internet"],
        pool: json["pool"],
        air: json["air"],
        pet: json["pet"],
        parking: json["parking"],
        breakfast: json["breakfast"],
        restaurant: json["restaurant"],
        bar: json["bar"],
        housekeeping: json["housekeeping"],
        frontDesk: json["frontDesk"],
      );

  Map<String, dynamic> toMap() => {
        "internet": internet,
        "pool": pool,
        "air": air,
        "pet": pet,
        "parking": parking,
        "breakfast": breakfast,
        "restaurant": restaurant,
        "bar": bar,
        "housekeeping": housekeeping,
        "frontDesk": frontDesk,
      };
}

class Direction {
  Direction({
    required this.street,
    required this.number,
    required this.colony,
    required this.state,
    required this.municipality,
    required this.postalCode,
  });

  String street;
  String number;
  String colony;
  String state;
  String municipality;
  String postalCode;

  factory Direction.fromMap(Map<String, dynamic> json) => Direction(
        street: json["street"],
        number: json["number"],
        colony: json["colony"],
        state: json["state"],
        municipality: json["municipality"],
        postalCode: json["postalCode"],
      );

  Map<String, dynamic> toMap() => {
        "street": street,
        "number": number,
        "colony": colony,
        "state": state,
        "municipality": municipality,
        "postalCode": postalCode,
      };
}

class FoodDrink {
  FoodDrink({
    required this.availableTime,
    required this.restaurants,
    required this.bars,
    required this.freeDailyReception,
  });

  String availableTime;
  int restaurants;
  int bars;
  bool freeDailyReception;

  factory FoodDrink.fromMap(Map<String, dynamic> json) => FoodDrink(
        availableTime: json["availableTime"],
        restaurants: json["restaurants"],
        bars: json["bars"],
        freeDailyReception: json["freeDailyReception"],
      );

  Map<String, dynamic> toMap() => {
        "availableTime": availableTime,
        "restaurants": restaurants,
        "bars": bars,
        "freeDailyReception": freeDailyReception,
      };
}

class Internet {
  Internet({
    this.rooms,
    this.places,
  });

  bool? rooms;
  Places? places;

  factory Internet.fromMap(Map<String, dynamic> json) => Internet(
        rooms: json["rooms"],
        places: json["places"] == null ? null : Places.fromMap(json["places"]),
      );

  Map<String, dynamic> toMap() => {
        "rooms": rooms,
        "places": places?.toMap(),
      };
}

class Places {
  Places({
    required this.public,
    required this.pool,
    required this.bar,
    required this.restaurant,
  });

  bool public;
  bool pool;
  bool bar;
  bool restaurant;

  factory Places.fromMap(Map<String, dynamic> json) => Places(
        public: json["public"],
        pool: json["pool"],
        bar: json["bar"],
        restaurant: json["restaurant"],
      );

  Map<String, dynamic> toMap() => {
        "public": public,
        "pool": pool,
        "bar": bar,
        "restaurant": restaurant,
      };
}

class More {
  More({
    this.activity,
  });

  String? activity;

  factory More.fromMap(Map<String, dynamic> json) => More(
        activity: json["activity"],
      );

  Map<String, dynamic> toMap() => {
        "activity": activity,
      };
}
