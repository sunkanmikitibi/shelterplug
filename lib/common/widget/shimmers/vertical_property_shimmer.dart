import 'package:flutter/material.dart';
import 'package:realestateapi/common/layout/grid_layout.dart';
import 'package:realestateapi/common/widget/shimmer.dart';

import '../../../utils/theme/custom_themes/sizes.dart';

class TVerticalPropertyShimmer extends StatelessWidget {
  const TVerticalPropertyShimmer({super.key, this.itemCount = 4});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return TGridLayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => const SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TShimmerEffect(width: 180, height: 180),
              SizedBox(height: TSizes.spaceBtwItems,),
              
              TShimmerEffect(width: 160, height: 15),
              SizedBox(height: TSizes.spaceBtwItems/2),
              TShimmerEffect(width: 110, height: 15)
            ],
          ),
        )
    );
  }
}
