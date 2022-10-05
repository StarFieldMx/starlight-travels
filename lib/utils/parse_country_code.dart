import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:starlight/models/country.dart';

class ParseCountryCode {
  static Future<Country> byCode(String code) async {
    final String? apiKey = dotenv.env['COUNTRYSKEY'];
    const baseUrl = "battuta.medunes.net";
    final path = "/api/country/code/${code.toLowerCase()}/";
    final url = Uri.https(baseUrl, path, {"key": apiKey});
    final response = await http.get(url);
    final String list = response.body;
    final start = list.indexOf('[');
    final end = list.indexOf(']');
    final map = list.substring(start + 1, end);
    final decodeResponse = countryFromMap(map);
    return decodeResponse;
  }
}
