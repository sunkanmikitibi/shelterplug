
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:realestateapi/common/widget/divider.dart';
import 'package:realestateapi/utils/constants/helpers/helper_functions.dart';
import 'package:realestateapi/utils/constants/text_strings.dart';
import 'package:realestateapi/screen/login/widgets/login_footer.dart';
import 'package:realestateapi/utils/constants/color.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart'; 


class TSignupForm extends StatefulWidget {
  const TSignupForm({
    super.key, 
  });
 

  @override
  State<TSignupForm> createState() => _TSignupFormState();
}

class _TSignupFormState extends State<TSignupForm> {
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Form(
        child: Column(
      children: [
        TextFormField( 
          decoration: const InputDecoration(
            labelText: "Name",
            prefixIcon: Icon(
              Iconsax.user,
            ),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),
        TextFormField( 
          decoration: const InputDecoration(
            labelText: "Email",
            prefixIcon: Icon(
              Iconsax.direct_right,
            ),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),
        TextFormField( 
          decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(
                Iconsax.eye_slash,
              ),
              labelText: TTexts.password),
        ),
        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        //Terms and Condition
        Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(value: true, onChanged: (value) {}),
            ),
            const SizedBox(
              width: TSizes.spaceBtwInputFields,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '${TTexts.iAgreeto} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: '${TTexts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color:
                          dark ? TColors.white : TColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? TColors.white : TColors.primaryColor,
                    ),
              ),
              TextSpan(
                  text: '${TTexts.andText} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: '${TTexts.termsandconditions} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color:
                          dark ? TColors.white : TColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? TColors.white : TColors.primaryColor,
                    ),
              ),
            ]))
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        //Sign up Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
              child: const Text(TTexts.registerNow),),
        ),
          const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        TLoginDivider(dividerText: TTexts.signUpWith.capitalize!,),
          const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
     const TLoginFooter()
      ],
    ));
  }
}
