import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:realestateapi/utils/constants/constants.dart';
import 'package:realestateapi/screen/edge_services/edge_services/success_submit.dart';

class HomeInteriorController extends GetxController {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  int? selectedlocation;
  TextEditingController citycontroller = TextEditingController();
  String? selectedscope;
  int? selectedvendor;
  TextEditingController budgetcontroller = TextEditingController();
  String? apartment;
  String? timeline;
  TextEditingController commentscontroller = TextEditingController();

  Future<void> createInteriorApplication() async {
    try {
      var headers = {'Content-type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.otherEndPoints.interiormanager);

      Map body = {
        'fullname': namecontroller.text.trim(),
        'phone': phoneController.text,
        'email': emailcontroller.text.trim(),
        'location_id': selectedlocation,
        'city': citycontroller.text,
        'budget': budgetcontroller.text.trim(),
        'vendor_id': selectedvendor,
        'type_of_apartment': apartment,
        'possession_timeline': timeline,
        'scope_of_work': selectedscope,
        'comments': commentscontroller.text,
      };

      //print(jsonEncode(body));

      http.Response response =
          await http.post(url, body: json.encode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        debugPrint(json['data'].toString());

        namecontroller.clear();
        phoneController.clear();
        citycontroller.clear();
        budgetcontroller.clear();
        emailcontroller.clear();

        Get.to(() => const HomeInteriorSuccess());
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
      debugPrint(e.toString());
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
