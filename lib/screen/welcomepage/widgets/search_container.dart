import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:realestateapi/utils/constants/helpers/helper_functions.dart';

import '../../../utils/constants/color.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/theme/custom_themes/sizes.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = false,
    this.showBorder = false,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
          color: showBackground
              ? dark
                  ? TColors.dark
                  : TColors.light
              : Colors.transparent,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
          border: showBorder ? Border.all(color: Colors.grey) : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: TColors.grey,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(text,
                style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
      ),
    );
  }
}
