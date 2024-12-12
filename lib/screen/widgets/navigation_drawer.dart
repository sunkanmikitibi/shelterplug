import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:realestateapi/screen/favorite/favorites.dart';
import 'package:realestateapi/screen/post/posts.dart';
import 'package:realestateapi/screen/sale_properties.dart';

import '../welcomepage/welcomescreen.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({super.key});
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child:
            Column(children: [_buildHeader(context), _buildMenuItems(context)]),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: [
            Colors.blue.shade700,
            Colors.blue.shade400,
            Colors.blue.shade500,
          ],
        ),
      ),
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          const CircleAvatar(
            radius: 64,
            backgroundImage: AssetImage(
              'assets/images/john.jpg',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'User',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'user@shelterplug.com',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 12,
        children: [
          ListTile(
            leading: const Icon(Iconsax.home),
            title: const Text('Home'),
            onTap: () => Get.to(()=> const WelcomeScreen()),
          ),
          ListTile(
              leading: const Icon(Iconsax.heart),
              title: const Text('Favourites'),
              onTap: () {
                Navigator.pop(context);
                 Get.to(() => const FavoriteScreen());
              }),
          ListTile(
            leading: const Icon(Iconsax.home5),
            title: const Text('Properties'),
            onTap: () {
              Navigator.pop(context);
              Get.to(() =>  const SaleProperties());
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Shelterplug Edge'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.list_sharp),
            title: const Text('News & Blog'),
            onTap: () {
              Get.offAll(const PostScreen());
            },
          ),
          const Divider(
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About us'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.people_outlined),
            title: const Text('Top Developers'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
