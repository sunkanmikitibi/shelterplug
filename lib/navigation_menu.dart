 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart'; 
import 'package:realestateapi/screen/favorite/favorites.dart';
import 'package:realestateapi/screen/post/posts.dart';
import 'package:realestateapi/screen/shelterplug_edge/edge_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screen/accounts/profile.dart';
import 'screen/welcomepage/welcomepage.dart';
import 'utils/constants/helpers/helper_functions.dart';

class NavigationMenu extends StatefulWidget {
  
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  static const String prefSelectedIndexKey = 'selectedIndex';
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          backgroundColor: dark ? Colors.black : Colors.white,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) async {
              controller.selectedIndex.value = index;
              final prefs  = await SharedPreferences.getInstance();
              prefs.setInt(prefSelectedIndexKey, controller.selectedIndex.value);
          },              
          destinations: const [
            NavigationDestination(
              icon: Icon(Iconsax.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.house),
              label: 'Edge',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.message),
              label: 'Blog',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.heart),
              label: 'Saved',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.user),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
  
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const WelcomePage(),
    const EdgeScreen(),
    const PostScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];
}
