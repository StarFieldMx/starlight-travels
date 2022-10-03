import 'dart:convert';

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
  });
  String email;
  String? displayName;
  bool emailVerified;
  String? phoneNumber;
  String? photoUrl;
  String? uid;

  UserStarlight copyWith({
    required String email,
    String? displayName,
    bool emailVerified = false,
    String? phoneNumber,
    String? photoUrl,
    String? uid,
  }) =>
      UserStarlight(
        displayName: displayName ?? this.displayName,
        email: email,
        emailVerified: emailVerified,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        photoUrl: photoUrl ?? this.photoUrl,
        uid: uid ?? this.uid,
      );

  factory UserStarlight.fromMap(Map<String, dynamic> json) => UserStarlight(
        displayName: json["displayName"],
        email: json["email"],
        emailVerified: json["emailVerified"],
        phoneNumber: json["phoneNumber"],
        photoUrl: json["photoURL"],
        uid: json["uid"],
      );
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
