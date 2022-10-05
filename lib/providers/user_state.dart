import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:starlight/models/user.dart';
import 'package:starlight/router/starlight_router.gr.dart';

class UserState extends ChangeNotifier {
  final storage = const FlutterSecureStorage();
  BuildContext? context;
  UserState() {
    _initializeUser();
  }
  String _token = '';
  UserStarlight? _user;

  UserStarlight? get user => _user;
  String get token => _token;
  bool get authentication => _token.isNotEmpty;

  set user(UserStarlight? value) {
    _user = value;
    notifyListeners();
  }

  void login(BuildContext newContext) {
    context = newContext;
    _initializeUser();
  }

  void _initializeUser() async {
    final String? rawUser = await storage.read(key: 'user');
    final String? token = await storage.read(key: 'token');
    final UserStarlight tempUser;
    if (token != null) _token = token;
    if (rawUser != null && token != null) {
      tempUser = userFromString(rawUser);
      _user = tempUser;
      context!.router.replaceNamed('main');
    }
  }

  void logOut() {
    _token = '';
    user = null;
  }
}
