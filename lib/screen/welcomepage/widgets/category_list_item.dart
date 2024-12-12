
import 'package:flutter/material.dart';
import 'package:realestateapi/utils/constants/color.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    super.key,
    required this.title,
    this.textColor,
    this.backgroundColor,
    this.onTap,
  });

  final String title;
  final Color? textColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Container(
              height: 35,
              width: 120,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color: TColors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text(title, style: const TextStyle(color: Colors.white),)),
            )
          ],
        ),
      ),
    );
  }
}
