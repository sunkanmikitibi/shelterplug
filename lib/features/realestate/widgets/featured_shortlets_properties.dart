import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:realestateapi/features/realestate/models/property_model.dart';
import 'package:realestateapi/features/realestate/propertydetails/property_details.dart';

import '../../../common/widget/home_banner.dart';
import '../../../common/widget/icons/t_favorite_icon.dart';
import '../../../common/widget/rounded_container.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/theme/custom_themes/sizes.dart';

class TShortLetProperty extends StatelessWidget {
  const TShortLetProperty({
    super.key,
    required this.property,
  });

  final PropertyModel property;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => PropertyDetailsScreen(property: property)),
      child: SizedBox(
        height: 250,
        child: Stack(
          children: [
            TRoundedBanner(
              width: 250,
              height: double.infinity,
              imageUrl: property.image!,
              applyImageRadius: true,
              isNetworkImage: true,
            ),
            Positioned(
              right: 10,
              top: 10,
              child: TFavoriteIcon(
                id: property.id,
              ),
            ),
            Positioned(
                bottom: 80,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7)
                  ),
                  width: 200,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(property.title,
                   style: const TextStyle(
                     fontSize: 18.0,
                   ),
                  overflow: TextOverflow.ellipsis,),
                ),
            )),
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
            Positioned(
                left: 0,
                bottom: 50,
                child: Container(
                  width: 200,
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.5)),
                  child: Text(
                    NumberFormat.compactCurrency(
                      locale: 'en-NG',
                      decimalDigits: 2,
                      symbol: 'N',
                    ).format(property.amount),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),),
          ],
        ),
      ),
    );
  }
}
