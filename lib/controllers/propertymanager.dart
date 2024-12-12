// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:realestateapi/utils/constants/constants.dart';
import 'package:realestateapi/screen/property_managers/success_submit.dart';

class PropertyManagerController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  int? vendor_id;
  int? state_id;
  String? type_of_house;
  TextEditingController expected_rent = TextEditingController();
  TextEditingController comments = TextEditingController();

  Future<void> createPropertyManagement() async {
    try {
      var headers = {'Content-type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.otherEndPoints.propertymanagers);

      Map body = {
        'name': name.text.trim(),
        'email': email.text.trim(),
        'phone': phone.text.trim(),
        'state_id': state_id,
        'vendor_id': vendor_id,
        'type_of_house': type_of_house,
        'expected_rent': expected_rent.text.trim(),
        'comments': comments.text,
      };

      http.Response response =
          await http.post(url, body: json.encode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        debugPrint(json['data'].toString());

        Get.to(() => const PropertyManagerSubmitSuccess());

        name.clear();
        email.clear();
        phone.clear();
        expected_rent.clear();
        comments.clear();
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
      Get.back();
      debugPrint(e.toString());
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
