import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:starlight/models/user.dart';

class AuthServices extends ChangeNotifier {
  final _baseUrl = "identitytoolkit.googleapis.com";
  final _firebaseToken = "AIzaSyBsXjft_FDGmBIwlV1Snbh_tnmVq6DKoHM";
  final _endpintURLLogin = "/v1/accounts:signInWithPassword";
  final _endpintURLRegister = "/v1/accounts:signUp";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // storage
  final storage = const FlutterSecureStorage();
  // Login and Register

  Future<String?> createUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      "password": password,
      'returnSecureToken': false
    };
    final url =
        Uri.https(_baseUrl, _endpintURLRegister, {'key': _firebaseToken});
    final data = json.encode(authData);
    final resp = await http.post(url, body: data);
    final Map<String, dynamic> decodeResponse = json.decode(resp.body);
    return decodeResponse.toString();
  }

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    final url = Uri.https(_baseUrl, _endpintURLLogin, {'key': _firebaseToken});
    final response = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeResponse = json.decode(response.body);
    print(decodeResponse);
    if (decodeResponse.containsKey('idToken')) {
      // TODO: Guardarlo en un lugar seguro
      await storage.write(key: 'token', value: decodeResponse['idToken']);
      return null;
    } else {
      return decodeResponse['error']['message'];
    }
  }

  Future<UserStarlight?> signInWithGoogle() async {
    String name;
    String email;
    String imageUrl;
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;
    if (googleSignInAuthentication == null) {
      return null;
    }
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User? user = authResult.user;
    assert(user?.email != null);
    assert(user?.displayName != null);
    assert(user?.photoURL != null);
    name = user?.displayName ?? '';
    email = user?.email ?? '';
    imageUrl = user?.photoURL ?? '';
    // Checar solo devuelve el primer nombre (Frausto)
    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }
    final isValid = user != null ? !user.isAnonymous : false;
    assert(isValid);
    assert(await user?.getIdToken() != null);
    final _idToken = await user?.getIdToken();
    final User currentUser = await _auth.currentUser!;
    assert(user?.uid == currentUser.uid);
    return userFromString(user.toString());
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();
    logOut();
  }

  void logOut() {
    storage.deleteAll();
  }
}
