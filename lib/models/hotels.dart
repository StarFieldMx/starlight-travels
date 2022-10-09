// To parse this JSON data, do
//
//     final hotels = hotelsFromMap(jsonString);

import 'dart:convert';

List<Hotel> hotelsFromMap(String str) =>
    List<Hotel>.from(json.decode(str).map((x) => Hotel.fromMap(x)));

String hotelsToMap(List<Hotel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Hotel {
  Hotel(
      {this.id,
      this.picture,
      required this.name,
      required this.rate,
      required this.direction,
      required this.amenties,
      required this.internet,
      required this.foodDrink,
      required this.thingsToDo,
      required this.accessibility,
      required this.more,
      required this.price});
  String? id;
  String? picture;
  String name;
  double rate;
  Direction direction;
  Amenties amenties;
  List<Internet> internet;
  FoodDrink foodDrink;
  List<More> thingsToDo;
  Accessibility accessibility;
  List<More> more;
  double price;
  factory Hotel.fromMap(Map<String, dynamic> json) => Hotel(
        picture: json["picture"],
        name: json["hotel"],
        rate: json["rate"].toDouble(),
        price: json["price"].toDouble(),
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
        "hotel": name,
        "rate": rate,
        "direction": direction.toMap(),
        "amenties": amenties,
        "internet": List<dynamic>.from(internet.map((x) => x.toMap())),
        "foodDrink": foodDrink.toMap(),
        "thingsToDo": thingsToDo == null
            ? null
            : List<dynamic>.from(thingsToDo.map((x) => x.toMap())),
        "accessibility": List<dynamic>.from(more.map((x) => x.toMap())),
        "price": price
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

enum AmentiesType {
  internet,
  pool,
  air,
  pet,
  parking,
  breakfast,
  restaurant,
  bar,
  housekeeping,
  frontDesk,
  none
}

class Amenties {
  Amenties(this.listAmenties);

  List<AmentiesType> listAmenties = [];

  factory Amenties.fromMap(Map<String, dynamic> json) {
    List<AmentiesType> newAms = [];
    if (json["internet"]) newAms.add(AmentiesType.internet);
    if (json["pool"]) newAms.add(AmentiesType.pool);
    if (json["air"]) newAms.add(AmentiesType.air);
    if (json["pet"]) newAms.add(AmentiesType.pet);
    if (json["parking"]) newAms.add(AmentiesType.parking);
    if (json["breakfast"]) newAms.add(AmentiesType.breakfast);
    if (json["restaurant"]) newAms.add(AmentiesType.restaurant);
    if (json["bar"]) newAms.add(AmentiesType.bar);
    if (json["housekeeping"]) newAms.add(AmentiesType.housekeeping);
    if (json["frontDesk"]) newAms.add(AmentiesType.frontDesk);

    return Amenties(newAms);
  }
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

  String get direction => getString();
  String getString() {
    return "$street $colony $number, $municipality, $state, $postalCode";
  }

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
        places: json["places"] != null ? Places.fromMap(json["places"]) : null,
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
