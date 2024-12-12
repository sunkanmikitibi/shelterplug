import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';
import 'package:realestateapi/common/widget/list_tiles.dart';
import 'package:realestateapi/common/widget/primary_header_container.dart';
import 'package:realestateapi/common/widget/section_heading.dart';
import 'package:realestateapi/common/widget/settings_menu_tile.dart';
import 'package:realestateapi/screen/help/help_screen.dart';
import 'package:realestateapi/utils/constants/color.dart';
import 'package:realestateapi/utils/repository/authentication_repository.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

import '../../features/personalization/controllers/user_controller.dart';
import '../../features/realestate/subscription_page/subscription_screen.dart';
import '../../utils/constants/text_strings.dart';
import '../authentications/login/login.dart';
import '../favorite/favorites.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Iconsax.arrow_left,
                        ),
                      )
                    ],
                  ),

                  //User Profile Card

                  const TUserProfileTile(),

                  const SizedBox(
                    height: 200,
                  ),
                ],
              ),
            ),
            //List of Setting Menu
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  //Account Settings
                  const TSectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subtitle: 'Set your account Address',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.money,
                    title: 'Subscriptions',
                    subtitle: 'Subscription Plans for Shelter Plug',
                    onTap: () => Get.to(
                      () => const SubscriptionScreen(),
                    ),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subtitle: 'Get Any Kind of Notification Message',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.heart,
                    title: 'My Favourites',
                    subtitle: 'Get all Your favorites Properties in one Place',
                    onTap: () => Get.to(() => const FavoriteScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subtitle: 'Manage Data Usage and connected Devices',
                    onTap: () {},
                  ),
                  //App Settings
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'Set your Location',
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subtitle: 'Search result is safe for all regions',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subtitle: 'Set Image Quality',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Icons.language_rounded,
                    title: 'App Language',
                    subtitle: 'English(Device\'s Language)',
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => const Padding(
                                padding: EdgeInsets.all(TSizes.defaultSpace),
                                child: Column(
                                  children: [
                                    TSectionHeading(
                                      title: 'App Language',
                                      showActionButton: false,
                                    ),
                                    ListTile(
                                      title: Text('English'),
                                    )
                                  ],
                                ),
                              ));
                    },
                  ),
                  TSettingsMenuTile(
                    icon: Icons.question_mark_outlined,
                    title: 'Help',
                    subtitle: 'Help Center, Contact us, Privacy Policy',
                    onTap: () => Get.to(() => const HelpScreen()),
                  ),

                  const SizedBox(height: TSizes.spaceBtwItems),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
