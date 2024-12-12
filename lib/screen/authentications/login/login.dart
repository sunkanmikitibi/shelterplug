import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/common/styles/spacing_styles.dart';
import 'package:realestateapi/screen/authentications/widgets/form_divider.dart';
import 'package:realestateapi/screen/authentications/widgets/login_form.dart';
import 'package:realestateapi/screen/login/widgets/login_header.dart';
import 'package:realestateapi/utils/constants/text_strings.dart';
import '../../../utils/theme/custom_themes/sizes.dart';
import '../widgets/login_footer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TLoginHeader(),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const TLoginForm(),
              //Divider
              TFormDivider(dividerText: TTexts.signInWith.capitalize!,),
              const SizedBox(height: TSizes.spaceBtwSections),
              //Footer
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
