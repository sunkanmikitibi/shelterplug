import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:get/get.dart';

import '../../../utils/popups/loaders.dart';
import 'package:http/http.dart' as http;
import '../model/plan.dart';

class PlanController extends GetxController {
  final plugin = PaystackPlugin();
  final planKey = GlobalKey<FormState>();
  String? plan;
  String publicKey = 'pk_test_b6ff1f21445cf2c860ca96b8ede9604e41a2642c';

  @override
  void onInit() {
    super.onInit();
    getDeveloperPlans();
    getHomeInteriorPlans();
    plugin.initialize(publicKey: publicKey);
  }

  Future<List<Plan>> getDeveloperPlans() async {
    try {
      var url = 'https://shelterplug.com/api/developerplans';
      var uri = Uri.parse(url);
      final response = await http.get(uri);
      final data = json.decode(response.body);
      final results = data as List<dynamic>;
      final plans = results
          .map(
            (e) => Plan(
              id: e['id'],
              amount: e['amount'],
              name: e['name'],
            ),
          )
          .toList();
      return plans;
    } catch (e) {
      return TLoaders.errorSnackBar(title: 'Oh Snap!!', message: e.toString());
    }
  }

  Future<List<Plan>> getHomeInteriorPlans() async {
    try {
      var url = 'https://shelterplug.com/api/homeinteriorplans';
      var uri = Uri.parse(url);
      final response = await http.get(uri);
      final data = json.decode(response.body);
      final results = data as List<dynamic>;
      final plans = results
          .map(
            (e) => Plan(
              id: e['id'],
              amount: e['amount'],
              name: e['name'],
            ),
          )
          .toList();
      return plans;
    } catch (e) {
      return TLoaders.errorSnackBar(title: 'Oh Snap!!', message: e.toString());
    }
  }

  Future<List<Plan>> getPropertyMgtPlans() async {
    try {
      var url = 'https://shelterplug.com/api/propertymgtplans';
      var uri = Uri.parse(url);
      final response = await http.get(uri);
      final data = json.decode(response.body);
      final results = data as List<dynamic>;
      final plans = results
          .map(
            (e) => Plan(
              id: e['id'],
              amount: e['amount'],
              name: e['name'],
            ),
          )
          .toList();
      return plans;
    } catch (e) {
      return TLoaders.errorSnackBar(title: 'Oh Snap!!', message: e.toString());
    }
  }
}
