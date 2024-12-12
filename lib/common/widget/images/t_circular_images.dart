import 'package:flutter/material.dart';
import 'package:realestateapi/utils/constants/helpers/helper_functions.dart';
import 'package:realestateapi/utils/constants/color.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

class TCircularImages extends StatelessWidget {
  const TCircularImages({
    super.key,
    this.width,
    this.height,
    this.size = TSizes.lg,
    this.color,
    required this.imageUrl,
    this.backgroundColor,
    this.onPressed,
    this.isNetworkImage = false,
  });

  final double? width, height, size;
  final String imageUrl;
  final Color? color;
  final bool isNetworkImage;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: backgroundColor != null
              ? backgroundColor!
              : THelperFunctions.isDarkMode(context)
                  ? TColors.black.withOpacity(0.9)
                  : TColors.white.withOpacity(0.9)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Image(
          fit: BoxFit.cover,
          image: isNetworkImage
              ? NetworkImage(imageUrl)
              : AssetImage(imageUrl) as ImageProvider,
        ),
      ),
    );
  }
}
