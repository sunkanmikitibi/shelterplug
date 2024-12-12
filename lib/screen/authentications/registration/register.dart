import 'package:flutter/material.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';
import 'package:realestateapi/utils/constants/text_strings.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

import 'widgets/signup_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [

            //Title
            Text(TTexts.signUpText, style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: TSizes.spaceBtwSections,),
            const TSignUpForm(),
          ],
        ),),
      ),
    );
  }
}