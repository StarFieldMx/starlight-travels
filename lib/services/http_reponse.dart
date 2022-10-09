import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart'
    show FlutterSecureStorage;
import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;
import 'package:starlight/models/flights.dart' show Flight;
import 'package:starlight/models/hotels.dart' show Hotel;
import 'package:starlight/models/rooms.dart' show Rooms;
import 'package:starlight/models/user.dart' show UserStarlight;
import 'package:starlight/services/notification_service.dart'
    show NotificationsService;

final baseAuth = dotenv.env['BASE_URL_AUTH'];
final firebaseToken = dotenv.env['FIREBASE_TOKEN'];
final dataBase = dotenv.env['BASE_URL_DATABASE'];

class HttpResponse {
  final storage = const FlutterSecureStorage();
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
    final user = await storage.read(key: 'user');
    final response = await http.get(url);
    final decode = json.decode(response.body);
    if (decode == null) return;
    if (decode is String) {
      return;
    }
    final Map<String, dynamic> map = decode;
    map.forEach(
      (key, value) {
        if (user != null) {
          if (UserStarlight.fromMap(json.decode(user)).uid != key) {
            final tempData = parseFrom(value);
            if (tempData is Flight) {
              tempData.id = key;
              list.add(tempData);
            } else if (tempData is Hotel) {
              tempData.id = key;
              list.add(tempData);
              // ! Settear imagen??
            } else if (tempData is Rooms) {
              tempData.id = key;
              list.add(tempData);
            }
          }
        }
      },
    );
  }

  // void _addMyFlights(
  //     String user, Map<String, dynamic> map, List<dynamic> list, key) {
  //   final tempUser = UserStarlight.fromMap(json.decode(user));
  //   if (tempUser.uid != null) {
  //     if (tempUser.uid == key) {
  //       if (map.isNotEmpty) {
  //         map[key].forEach((keyFlight, value) {
  //           final myFlight = MyFlights.fromMap(value);
  //           myFlight.userId = tempUser.uid;
  //           myFlight.flight.id = keyFlight;
  //           list.add(myFlight);
  //         });
  //       }
  //     }
  //   }
  // }

  // void _addMyRooms(
  //     String user, Map<String, dynamic> map, List<dynamic> list, key) {
  //   final tempUser = UserStarlight.fromMap(json.decode(user));
  //   if (tempUser.uid != null) {
  //     if (tempUser.uid == key) {
  //       if (map.isNotEmpty) {
  //         map[key].forEach((keyFlight, value) {
  //           final myFlight = MyRooms.fromMap(value);
  //           myFlight.userId = tempUser.uid;
  //           myFlight.room.id = keyFlight;
  //           list.add(myFlight);
  //         });
  //       }
  //     }
  //   }
  // }

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

  Future<void> buyFlightOrRoom(dynamic item, List<dynamic> list) async {
    Uri? url;
    http.Response? resp;
    String? token = await storage.read(key: 'token');
    String? user = await storage.read(key: 'user');
    if (user != null) {
      final userStarlight = UserStarlight.fromMap(json.decode(user));
      if (userStarlight.uid != null) {}
      if (item is Rooms) {
        url = Uri.https(
            dataBase!, "myRooms/${userStarlight.uid}.json", {'auth': token});
        resp = await http.post(url, body: json.encode(item.toMap()));
      } else if (item is Flight) {
        url = Uri.https(
            dataBase!, "myFlights/${userStarlight.uid}.json", {'auth': token});
        resp = await http.post(url, body: json.encode(item.toMap()));
      }
      final decodedData = json.decode(resp!.body);
      if (decodedData["error"] != null) {
        NotificationsService.showSnackbar(decodedData["error"]);
      }
      list.add(item);
    }
  }
}
