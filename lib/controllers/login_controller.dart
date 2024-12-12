

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:realestateapi/utils/constants/constants.dart';
import 'package:realestateapi/screen/dashboard/property_dash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail() async {
      var headers = { 'Content-Type' :'application/json' };
      try {
        var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'email' : emailController.text.trim(),
        'password' : passwordController.text.trim(),
      };

      http.Response response = await http.post(url, headers: headers, body: jsonEncode(body));

      if(response.statusCode == 200) {
        final json = jsonDecode(response.body);
          debugPrint(json['user'].toString());
        var token = json['token'];
        debugPrint(token);
        final SharedPreferences prefs = await _prefs;

        await prefs.setString('token', token);
 
 
        emailController.clear();
        passwordController.clear();

       Get.to(() => const PropertyDash());
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
      }
      } catch(e) {
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