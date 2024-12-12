import 'package:flutter/material.dart'; 
import 'package:realestateapi/utils/constants/text_strings.dart';
import 'package:realestateapi/screen/signup/widgets/signup_form.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';
 
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              Text(
                TTexts.signUpText,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //Forms
              const TSignupForm(),
            ],
          ),
        ),
      ),
    );
  }
}
