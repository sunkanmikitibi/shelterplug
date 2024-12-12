import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/screen/parkersmovers/parkerdetails.dart';

import '../utils/constants/constants.dart';
import 'package:http/http.dart' as http;

import '../model/location.dart';

class MoverController extends GetxController {
  int? locationTo;
  int? locationFrom;
  TextEditingController dateofmovement = TextEditingController();
  TextEditingController comment = TextEditingController();

  Future<List<Location>> getLocationTo() async {
    var url = 'https://shelterplug.com/api/locations';
    var uri = Uri.parse(url);
    final response = await http.get(uri);
    final data = json.decode(response.body);
    final results = data as List<dynamic>;
    final locations = results
        .map((e) => Location(id: e['id'], locationname: e['locationname']))
        .toList();
    return locations;
  }

  Future<List<Location>> getLocationFrom() async {
    var url = ApiEndPoints.baseUrl + ApiEndPoints.otherEndPoints.locations;
    var uri = Uri.parse(url);
    final response = await http.get(uri);
    final data = json.decode(response.body);
    final results = data as List<dynamic>;
    final locations = results
        .map((e) => Location(id: e['id'], locationname: e['locationname']))
        .toList();
    return locations;
  }

  Future<void> createMovers() async {
    try {
      var headers = {'Content-type': 'application/json'};
      var url =
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.otherEndPoints.movers);

      Map body = {
        'location_to': locationTo,
        'location_from': locationFrom,
        'date_of_movement': dateofmovement.text,
        'comment': comment.text,
      };

      //print(jsonEncode(body));

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        debugPrint(json['data'].toString());
        dateofmovement.clear();
        comment.clear();
        Get.to(() => const ParkerMoverDetail());
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) => SimpleDialog(
                title: const Text('Error'),
                contentPadding: const EdgeInsets.all(20),
                children: [
                  Text(
                    e.toString(),
                  ),
                ],
              ));
    }
  }
}
