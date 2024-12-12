import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/features/authentication/signup/signup_controller.dart';
import 'package:realestateapi/utils/constants/helpers/helper_functions.dart';

import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/theme/custom_themes/sizes.dart';

class TTermsAndConditionWidget extends StatelessWidget {
  const TTermsAndConditionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicyCheck.value,
              onChanged: (value) {
                controller.privacyPolicyCheck.value =
                !controller.privacyPolicyCheck.value;

                debugPrint(value.toString());
              },

            ),
          ),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${TTexts.iAgreeto} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: TTexts.privacyPolicy,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.white : TColors.primary,
                  decoration: TextDecoration.underline)),
          TextSpan(
              text: '${TTexts.andText} ',
              style: Theme.of(context).textTheme.bodySmall),
        ])),
      ],
    );
  }
}
