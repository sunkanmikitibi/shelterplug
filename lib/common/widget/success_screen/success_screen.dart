import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/common/styles/spacing_styles.dart';
import 'package:realestateapi/screen/authentications/login/login.dart';

import '../../../utils/constants/text_strings.dart';
import '../../../utils/constants/helpers/helper_functions.dart';
import '../../../utils/theme/custom_themes/image_strings.dart';
import '../../../utils/theme/custom_themes/sizes.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(children: [
            Image(
              image: const AssetImage(TImages.staticSuccessIllustration),
              width: THelperFunctions.screenWidth() * 0.6,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            Text(
              TTexts.yourAccountCreatedTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            /// Title & Subtitle
            Text(
              TTexts.yourAccountCreatedSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text(TTexts.tContinue),
                onPressed: () => Get.to(() => const LoginScreen()), 
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
