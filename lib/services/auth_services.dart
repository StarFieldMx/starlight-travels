import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:starlight/models/user.dart';
import 'package:starlight/services/http_reponse.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthServices extends ChangeNotifier {
  final _endpintURLLogin = dotenv.env['ENDPURLLOGIN'];
  final _endpintURLRegister = dotenv.env['ENDPURLREGISTER'];
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  User? googleUser;

  // storage
  final storage = const FlutterSecureStorage();
  // Login and Register

  Future<String?> createUser(
      {required String email,
      required String password,
      required String name,
      required String lastName}) async {
    final Map<String, dynamic> authData = {
      'email': email,
      "password": password,
      'returnSecureToken': false
    };
    final Map<String, dynamic> decodeResponse =
        await HttpResponse.getAuthReponse(
      authData,
      _endpintURLRegister!,
    );
    return decodeResponse.toString();
  }

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    final Map<String, dynamic> decodeResponse =
        await HttpResponse.getAuthReponse(
      authData,
      _endpintURLLogin!,
    );
    if (decodeResponse.containsKey('idToken')) {
      final UserStarlight tempUser = UserStarlight.fromMap(decodeResponse);
      // TODO: Guardarlo en un lugar seguro
      await storage.write(key: 'token', value: decodeResponse['idToken']);
      await storage.write(key: 'user', value: tempUser.toJson().toString());
      return null;
    } else {
      return decodeResponse['error']['message'];
    }
  }

  Future<UserStarlight?> signInWithGoogle() async {
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
    final isValid = user != null ? !user.isAnonymous : false;
    assert(isValid);
    assert(await user?.getIdToken() != null);
    final idToken = await user?.getIdToken();
    final User googleUser = _auth.currentUser!;
    assert(user?.uid == googleUser.uid);
    storage.write(key: 'token', value: idToken);
    final userStarlight = UserStarlight(
      email: user?.email ?? '',
      displayName: user?.displayName,
      emailVerified: user?.emailVerified ?? false,
      phoneNumber: user?.phoneNumber,
      photoUrl: user?.photoURL,
      uid: user?.uid,
    );
    await storage.write(key: 'user', value: userStarlight.toJson().toString());
    return userStarlight;
  }

  void signOutGoogle(BuildContext context) async {
    if (googleUser != null) {
      await googleSignIn.signOut();
    }
    // googleSignIn.disconnect();
    logOut();
    context.router.replaceNamed('main');
  }

  void logOut() {
    storage.deleteAll();
  }
}
