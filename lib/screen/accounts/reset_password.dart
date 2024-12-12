import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/utils/constants/helpers/helper_functions.dart';
import 'package:realestateapi/utils/theme/custom_themes/image_strings.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart'; 

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
              children: [

            //Image
            Image(image: const AssetImage(TImages.deliveredEmail), width: THelperFunctions.screenWidth() * 0.6,),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Text(email),
            //Title

            //Subtitle

            //Elevated Button
          ]),
        ),
      ),
    );
  }
}