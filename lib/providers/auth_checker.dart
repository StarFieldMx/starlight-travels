import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthChecker extends ChangeNotifier {
  User? _user;
  User? get user => _user;
  set user(User? value) {
    _user = value;
    notifyListeners();
  }

  AuthChecker() {
    _checkerAuth();
  }
  void _checkerAuth() {
    FirebaseAuth.instance.authStateChanges().listen((User? stateUser) {
      if (stateUser == null) {
        user = stateUser;
      } else {
        user = stateUser;
      }
    });
  }
}
