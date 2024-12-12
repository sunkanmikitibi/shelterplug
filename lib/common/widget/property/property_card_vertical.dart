import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:realestateapi/common/widget/home_banner.dart';
import 'package:realestateapi/common/widget/property_title_text.dart';
import 'package:realestateapi/common/widget/rounded_container.dart';
import 'package:realestateapi/features/realestate/models/property_model.dart';
import 'package:realestateapi/utils/constants/helpers/helper_functions.dart';
import 'package:realestateapi/utils/constants/color.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

import '../../../features/realestate/propertydetails/property_details.dart';
import '../../styles/shadows.dart';
import '../icons/t_favorite_icon.dart';

class TPropertyCardVertical extends StatelessWidget {
  const TPropertyCardVertical({super.key, required this.property});
  final PropertyModel property;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Get.to(() => PropertyDetailsScreen(
              property: property,
            ));
      },
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [
            TShadowStyle.verticalPropertyShadow,
          ],
          borderRadius: BorderRadius.circular(
            TSizes.propertyImageRadius,
          ),
          color: dark ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          children: [
            // Thumbnail Wishlist button
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  //Thumbnail Image
                  TRoundedBanner(
                    height: double.infinity,
                    imageUrl: property.image!,
                    applyImageRadius: true,
                    isNetworkImage: true,
                  ), //--Tag
                  Positioned(
                    top: 12,
                    left: 10,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondaryColor.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm,
                        vertical: TSizes.xs,
                      ),
                      child: Text(
                        property.categoryId == '1'
                            ? 'Rent'
                            : (property.categoryId == "2")
                                ? 'Buy'
                                : 'Shortlets',
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                              color: TColors.black,
                            ),
                      ),
                    ),
                  ),
                  //Favorite Icon Button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: TFavoriteIcon(
                      id: property.id,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            //details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TPropertyTitleText(
                    title: property.title,
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),

                  TPropertyTitleText(
                    title: property.propertyAddress!,
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        NumberFormat.compactCurrency(
                          locale: 'en-NG',
                          decimalDigits: 2,
                          symbol: 'N',
                        ).format(property.amount),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              TSizes.cardRadiusMd,
                            ),
                            bottomRight: Radius.circular(
                              TSizes.cardRadiusMd,
                            ),
                          ),
                        ),
                        child: const SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: TColors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
