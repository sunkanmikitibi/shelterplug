import 'package:flutter/material.dart';
import 'package:realestateapi/utils/device/device_utility.dart';
import 'package:realestateapi/controllers/onboarding_controller.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';
 
class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(
          onPressed: () =>OnBoardingController.instance.skipPage(),
          child: const Text('Skip'),
        ));
  }
}