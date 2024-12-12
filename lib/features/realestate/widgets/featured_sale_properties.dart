
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/features/realestate/controllers/home_property_controller.dart';

import '../../../common/layout/grid_layout.dart';
import '../../../common/widget/property/property_card_vertical.dart';
import '../../../common/widget/section_heading.dart';
import '../../../common/widget/shimmers/vertical_property_shimmer.dart';
import '../../../screen/buyproperties/buyproperty.dart';
import '../../../utils/theme/custom_themes/sizes.dart';

class FeaturedSaleProperties extends StatelessWidget {
  const FeaturedSaleProperties({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePropertyController());
    return Column(
      children: [
        TSectionHeading(
          title: 'For Sale',
          buttonTitle: 'View All',
          onPressed: () => Get.to(
                () => const BuyPropertyScreen(),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Obx(
              () {
            if (controller.isLoading.value) {
              return const TVerticalPropertyShimmer();
            }
            if (controller.featuredSaleProperties.isEmpty) {
              return Center(
                child: Text('No Properties...',
                    style: Theme.of(context).textTheme.bodySmall),
              );
            }
            return TGridLayout(
              itemCount: controller.featuredSaleProperties.length,
              itemBuilder: (_, index) => TPropertyCardVertical(
                  property: controller.featuredSaleProperties[index]),
            );
          },
        ),
      ],
    );
  }
}
