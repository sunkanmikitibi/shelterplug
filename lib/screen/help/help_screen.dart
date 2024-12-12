import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';
import 'package:realestateapi/common/widget/section_heading.dart';
import 'package:realestateapi/common/widget/settings_menu_tile.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TAppBar(
              showBackArrow: true,
              title: Text('Help'),
            ),
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TSectionHeading(title: 'Help Center', showActionButton: false,),
                   SizedBox(height: TSizes.spaceBtwItems,),
                  TSettingsMenuTile(icon: Icons.help, title: 'Help Center', subtitle: 'Get Help'),
                  SizedBox(height: TSizes.spaceBtwItems,),
                  TSettingsMenuTile(icon: Iconsax.user, title: 'Contact us', subtitle: 'Questions?, Need Help?'),
                  SizedBox(height: TSizes.spaceBtwItems,),
                  TSettingsMenuTile(icon: Iconsax.document, title: 'Terms and Privacy Policy', subtitle: 'Read our policy'),
                ],
              ),

            ),


          ],
        ),
      ),
    );
  }
}
