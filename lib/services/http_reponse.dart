import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:starlight/models/flights.dart';
import 'package:starlight/models/hotels.dart';
import 'package:starlight/models/rooms.dart';

final baseAuth = dotenv.env['BASE_URL_AUTH'];
final firebaseToken = dotenv.env['FIREBASE_TOKEN'];
final dataBase = dotenv.env['BASE_URL_DATABASE'];

class HttpResponse {
  final storage = FlutterSecureStorage();
  // ! response not !!! its gonna be a put method
  Future<Map<String, dynamic>> getHttpReponseAuth(
      String path, String? auth) async {
    final url = Uri.https(dataBase!, path, {"auth": auth ?? ''});
    // ! Put method
    final response = await http.get(url);
    final Map<String, dynamic> map = json.decode(response.body);
    return map;
  }

  Future<Map<String, dynamic>> getHttpReponse(String path) async {
    final url = Uri.https(dataBase!, path);
    final response = await http.get(url);
    final Map<String, dynamic> map = json.decode(response.body);
    return map;
  }

  Future<Map<String, dynamic>> getHttpReponseFrom(
      String base, String path) async {
    final url = Uri.https(base, path);
    final response = await http.get(url);
    final Map<String, dynamic> map = json.decode(response.body);
    return map;
  }

  Future<void> getHttpReponseFromList(String path,
      Function(Map<String, dynamic>) parseFrom, List<dynamic> list) async {
    final url = Uri.https(
      dataBase!,
      path,
    );
    final response = await http.get(url);
    final decode = json.decode(response.body);
    if (decode is String) {
      return;
    }
    final Map<String, dynamic> map = decode;
    map.forEach((key, value) {
      final tempData = parseFrom(value);
      if (tempData is Flight) {
        tempData.id = key;
      } else if (tempData is Hotel) {
        tempData.id = key;
        // ! Settear imagen??
      }
      list.add(tempData);
    });
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

  Future<bool> buyFlightOrRoom(dynamic item, List<dynamic> list) async {
    Uri? url;
    http.Response? resp;
    String? token = await storage.read(key: 'token');
    if (item is Flight) {
      url = Uri.https(dataBase!, "myFlights.json", {'auth': token});
      resp = await http.post(url, body: json.encode(item.toMap()));
    } else if (item is Rooms) {
      url = Uri.https(dataBase!, "myRooms.json", {'auth': token});
      resp = await http.post(url, body: json.encode(item.toMap()));
    }
    final decodedData = json.decode(resp!.body);
    item.id = decodedData["name"];
    list.add(item);
    return false;
  }
}
