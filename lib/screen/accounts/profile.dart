import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/features/personalization/controllers/user_controller.dart';
import 'package:realestateapi/screen/authentications/login/login.dart';
import 'package:realestateapi/screen/settings/settings_screen.dart';
import 'package:realestateapi/utils/constants/text_strings.dart';
import 'package:realestateapi/utils/repository/authentication_repository.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                "assets/images/signup.png",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 5),
                SizedBox(
                    width: double.infinity,
                    child: controller.deviceStorage.read('isLoggedIn') != true
                        ? ElevatedButton(
                            onPressed: () {
                              Get.to(() => const LoginScreen());
                              controller.deviceStorage
                                  .write('isLoggedIn', true);
                            },
                            child: const Text("Login"),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              AuthenticationRepository.instance.logout();
                              controller.deviceStorage
                                  .write('isLoggedIn', false);

                              debugPrint('Logout Successful');
                            },
                            child: const Text(TTexts.logout))),
                TextButton(
                    onPressed: () {
                      Get.to(
                        () => const SettingsScreen(),
                      );
                    },
                    child: const Text('Settings'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
