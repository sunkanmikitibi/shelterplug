
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/features/authentication/login/controllers/login_controller.dart';
import 'package:realestateapi/utils/constants/color.dart';

import '../../../utils/theme/custom_themes/image_strings.dart';
import '../../../utils/theme/custom_themes/sizes.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: (){
              controller.googleSignIn();
              //debugPrint('Login with Google');
            },
            icon: const Image(image: AssetImage(TImages.google), width: TSizes.iconMd, height: TSizes.iconMd,),
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: (){
              debugPrint('Login with facebook');
            },
            icon: const Image(image: AssetImage(TImages.facebook), width: TSizes.iconMd, height: TSizes.iconMd,),
          ),
        ),
      ],
    );
  }
}
