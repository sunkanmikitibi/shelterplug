import 'package:flutter/material.dart';
import 'package:realestateapi/utils/device/device_utility.dart';
import 'package:realestateapi/utils/constants/helpers/helper_functions.dart';
import 'package:realestateapi/controllers/onboarding_controller.dart';
import 'package:realestateapi/utils/constants/color.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingNavigation extends StatelessWidget {
  const OnBoardingNavigation({
    super.key,
  });
 
  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
     final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: TSizes.defaultSpace,
        child: SmoothPageIndicator(
          effect: ExpandingDotsEffect(activeDotColor: dark ? TColors.light :  TColors.dark, dotHeight: 6,),
      controller: controller.pageController,
      onDotClicked: controller.dotNavigationClick,
      count: 3,
    ),);
  }
}
