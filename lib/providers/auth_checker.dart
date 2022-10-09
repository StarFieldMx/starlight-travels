import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:starlight/models/user.dart';
import 'package:starlight/providers/user_state.dart';

class AuthChecker extends ChangeNotifier {
  final storage = const FlutterSecureStorage();
  User? _user;
  User? get user => _user;
  set user(User? value) {
    _user = value;
    notifyListeners();
  }

  AuthChecker(BuildContext context) {
    _checkerAuth(context);
  }
  void _checkerAuth(BuildContext context) {
    final userState = Provider.of<UserState>(context, listen: false);
    FirebaseAuth.instance.authStateChanges().listen((User? stateUser) {
      // assert(stateUser == null);
      if (stateUser == null) {
        user = stateUser;
      } else {
        user = stateUser;
        userState.user = UserStarlight.fromUserFirebase(user);
      }
    });
    FirebaseAuth.instance.idTokenChanges().listen((event) {
      String token = user?.refreshToken ?? '';
      if (token.isNotEmpty) {
        storage.write(key: 'token', value: token);
      }
    });
  }
}
