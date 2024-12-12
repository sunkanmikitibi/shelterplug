import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/common/widget/section_heading.dart';
import 'package:realestateapi/features/realestate/controllers/home_property_controller.dart';

import '../../../common/layout/grid_layout.dart';
import '../../../common/widget/property/property_card_vertical.dart';
import '../../../common/widget/shimmers/vertical_property_shimmer.dart';
import '../../../screen/rentproperties/rent_properties.dart';
import '../../../utils/theme/custom_themes/sizes.dart';

class FeaturedRentProperty extends StatelessWidget {
  const FeaturedRentProperty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = HomePropertyController.instance;
    return Column(
      children: [
        TSectionHeading(
          title: 'For Rent',
          buttonTitle: 'View all',
          onPressed: () => Get.to(
                () => const RentPropertiesScreen(),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        Obx(() {
          if (controller.isLoading.value) {
            return const TVerticalPropertyShimmer();
          }
          if (controller.featuredRentProperties.isEmpty) {
            return Center(
              child: Text('No Properties...',
                  style: Theme.of(context).textTheme.bodySmall),
            );
          }
          return TGridLayout(
              itemCount: controller.featuredRentProperties.length,
              itemBuilder: (context, index) {
                return TPropertyCardVertical(
                  property: controller.featuredRentProperties[index],
                );
              });
        }),
      ],
    );
  }
}
