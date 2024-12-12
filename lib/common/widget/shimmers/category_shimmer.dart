
import 'package:flutter/material.dart';

import '../../../utils/theme/custom_themes/sizes.dart';
import '../shimmer.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({super.key,  this.itemCount = 6,});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_,__){
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TShimmerEffect(width: 60, height: 60, radius: 55,),
              SizedBox(height: TSizes.spaceBtwItems / 2,),
              TShimmerEffect(width: 65, height: 8),
            ],
          );
        },
        separatorBuilder: (_,__)=>const SizedBox(width: TSizes.spaceBtwItems,),
        itemCount: itemCount,
      ),
    );
  }
}
