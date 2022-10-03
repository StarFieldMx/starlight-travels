import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:starlight/models/user.dart';

class UserState extends ChangeNotifier {
  final storage = const FlutterSecureStorage();
  late final BuildContext context;
  UserState() {
    _initializeUser();
  }
  String _token = '';
  late final UserStarlight _user;

  UserStarlight get user => _user;
  String get token => _token;
  bool get authentication => _token.isNotEmpty;

  set user(UserStarlight value) {
    _user = value;
    notifyListeners();
  }

  void login() {
    _initializeUser();
    context.router.replaceNamed('main');
  }

  void _initializeUser() async {
    final String? rawUser = await storage.read(key: 'user');
    final String? token = await storage.read(key: 'token');
    final UserStarlight tempUser;
    if (token != null) _token = token;
    if (rawUser != null && token != null) {
      tempUser = userFromString(rawUser);
      _user = tempUser;
      context.router.replaceNamed('main');
    }
  }
}
