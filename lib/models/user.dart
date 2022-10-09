import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:starlight/models/user_details.dart';

UserStarlight userFromString(String str) =>
    UserStarlight.fromMap(json.decode(str));

String userToMap(UserStarlight data) => json.encode(data.toMap());

class UserStarlight {
  UserStarlight({
    required this.email,
    this.displayName,
    this.emailVerified = false,
    this.phoneNumber,
    this.photoUrl,
    this.uid,
    this.userDetails,
  });
  String email;
  String? displayName;
  bool emailVerified;
  String? phoneNumber;
  String? photoUrl;
  String? uid;
  UserDetails? userDetails;

  factory UserStarlight.fromMap(Map<String, dynamic> json) => UserStarlight(
        displayName: json["displayName"],
        email: json["email"],
        emailVerified: json["emailVerified"] ?? false,
        phoneNumber: json["phoneNumber"],
        photoUrl: json["photoURL"],
        uid: json["uid"],
      );
  factory UserStarlight.fromUserFirebase(User? user) {
    return UserStarlight(
      email: user?.email ?? '',
      displayName: user?.displayName,
      emailVerified: user?.emailVerified ?? false,
      phoneNumber: user?.phoneNumber,
      photoUrl: user?.photoURL,
      uid: user?.uid,
    );
  }
  Map<String, dynamic> toMap() => {
        "displayName": displayName,
        "email": email,
        "emailVerified": emailVerified,
        "phoneNumber": phoneNumber,
        "photoURL": photoUrl,
        "uid": uid,
      };
  String toJson() => json.encode(toMap());
}
