import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

final baseAuth = dotenv.env['BASE_URL_AUTH'];
final firebaseToken = dotenv.env['FIREBASE_TOKEN'];
final dataBase = dotenv.env['BASE_URL_DATABASE'];

class HttpReponse {
  static Future<Map<String, dynamic>> getHttpReponseAuth(
      String path, String? auth) async {
    final url = Uri.https(dataBase!, path, {"auth": auth ?? ''});
    final response = await http.get(url);
    final Map<String, dynamic> map = json.decode(response.body);
    return map;
  }

  static Future<Map<String, dynamic>> getHttpReponse(String path) async {
    final url = Uri.https(dataBase!, path);
    final response = await http.get(url);
    final Map<String, dynamic> map = json.decode(response.body);
    return map;
  }

  static Future<Map<String, dynamic>> getAuthReponse(
    Map<String, dynamic> authData,
    String path,
  ) async {
    final url = Uri.https(baseAuth!, path, {"key": firebaseToken});
    final data = json.encode(authData);
    final resp = await http.post(url, body: data);
    final Map<String, dynamic> map = json.decode(resp.body);
    return map;
  }
}
