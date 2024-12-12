import 'dart:convert';
import 'package:realestateapi/model/location.dart';
import 'package:http/http.dart' as http;

class LocationService {
  static Future<List<Location>?> getLocations() async {
    const url = 'https://shelterplug.com/api/locations';

    final uri = Uri.parse(url);

    final response = await http.get(uri);

    final data = json.decode(response.body);

    final results = data as List<dynamic>;

    final locations = results
        .map((e) => Location(id: e['id'], locationname: e['locationname']))
        .toList();

    return locations;
  }
}
