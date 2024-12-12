import 'package:flutter/material.dart';
import 'package:realestateapi/utils/constants/helpers/helper_functions.dart';
import 'package:realestateapi/utils/constants/text_strings.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

import '../../../utils/theme/custom_themes/image_strings.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key, 
  });
 

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,             
      children: [
        Image(
          image: AssetImage(
            dark ? TImages.lightAppLogo : TImages.darkAppLogo,
          ),
          width: 100,
        ),
        Text(
          TTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: TSizes.sm,
        ),
        Text(
          TTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}