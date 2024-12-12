
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/property.dart';

class PropertyApi {
  
  static Future <List<Property>> fetchProperties() async {
    //debugPrint('All Properties');
    const url = 'https://shelterplug.com/api/property'; 
    final uri = Uri.parse(url);
    //final uri2 = Uri.parse(urlOnline);
    final response = await http.get(uri);

    final data = json.decode(response.body);

    final results = data as List<dynamic>;

    final allproperties = results.map((e) {
      return Property(
          id: e['id'],
          title: e['title'],
          slug: e['slug'],
          bathrooms: e['bathrooms'],
          bedrooms: e['bedrooms'],
          amount: e['amount'],
          type: e['type'],
          image: e['image'].toString(),
          city: e['city'],
          property_address: e['property_address']);
    }).toList();

    return allproperties;

  }
}