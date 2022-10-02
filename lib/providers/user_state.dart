import 'package:flutter/material.dart';
import 'package:starlight/models/user.dart';

class UserState extends ChangeNotifier {
  late final UserStarlight _user;

  UserStarlight get user => _user;

  set user(UserStarlight value) {
    _user = value;
    notifyListeners();
  }
}
