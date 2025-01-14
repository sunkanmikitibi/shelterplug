import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:http/http.dart' as http;
import 'package:realestateapi/screen/dashboard/property_dash.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants/constants.dart';

class RegistrationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

 final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithEmail() async {
    try {
      var headers = {'Content-type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.registerEmail);

      Map body = {
        'name': nameController.text,
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 201) {
        final json = jsonDecode(response.body);
        //debugPrint(json['user'].toString());
        var token = json['token'];
        //debugPrint(token);
        final SharedPreferences prefs = await _prefs;

        await prefs.setString('token', token);

        nameController.clear();
        emailController.clear();
        passwordController.clear();
        
        Get.to(() => const PropertyDash());
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [
                Text(
                  e.toString(),
                ),
              ],
            );
          });
    }
  }
}
