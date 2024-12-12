
  import 'package:flutter/material.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

import '../../../utils/theme/custom_themes/image_strings.dart';

class TLoginFooter extends StatelessWidget {
    const TLoginFooter({
      super.key,
    });

    @override
    Widget build(BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Image(
                width: TSizes.iconMd,
                height: TSizes.iconMd,
                image: AssetImage(TImages.google),
              ),
            ),
          ),
          const SizedBox(
            width: TSizes.spaceBtwItems,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Image(
                width: TSizes.iconMd,
                height: TSizes.iconMd,
                image: AssetImage(TImages.facebook),
              ),
            ),
          ),
        ],
      );
    }
  }
