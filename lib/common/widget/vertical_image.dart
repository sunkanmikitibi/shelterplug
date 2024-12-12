import 'package:flutter/material.dart';
import 'package:realestateapi/utils/constants/helpers/helper_functions.dart';

import '../../utils/theme/custom_themes/sizes.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.title,
    required this.image,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.white,
    this.onTap,
  });
  final String title, image;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(TSizes.sm),
            decoration: BoxDecoration(
              color: backgroundColor ??
                  (dark
                      ? Colors.black
                      : Colors.white),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Image.asset(
                image,
                fit: BoxFit.cover,

              ),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems / 2,
          ),
          SizedBox(
            width: 80,
            child: Text(
              title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style:
                  Theme.of(context).textTheme.bodySmall!.apply(color: textColor),
            ),
          ),
        ],
      ),
    );
  }
}
