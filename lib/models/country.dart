// To parse this JSON data, do
//
//     final country = countryFromMap(jsonString);

import 'dart:convert';

import 'package:starlight/utils/parse_country_code.dart';

Country countryFromMap(String str) => Country.fromMap(json.decode(str));

String countryToMap(Country data) => json.encode(data.toMap());

class Country {
  Country({
    this.name,
    required this.code,
  });

  String? name;
  String code;
  Country copyWith({
    required String name,
    required String code,
  }) =>
      Country(
        name: name,
        code: code,
      );
  factory Country.fromMap(Map<String, dynamic> json) => Country(
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "code": code,
      };
  Future<Country> get country => ParseCountryCode.byCode(code);
}
