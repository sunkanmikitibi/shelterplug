import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:realestateapi/screen/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PropertyDash extends StatefulWidget {
  const PropertyDash({super.key});

  @override
  State<PropertyDash> createState() => _PropertyDashState();
}

class _PropertyDashState extends State<PropertyDash> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shelter Plug"),
        actions: [
          IconButton(onPressed: () async {
            final SharedPreferences prefs = await _prefs;
            prefs.clear();
            Get.offAll(const LoginSigninScreen());
          }, icon: const Icon(Iconsax.logout))
        ],
      ),
      body: const Center(
        child: Text("Welcome"),
      ),
    );
  }
}