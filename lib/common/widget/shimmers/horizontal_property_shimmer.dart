import 'package:flutter/material.dart';
import 'package:realestateapi/common/widget/shimmer.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

class THorizontalPropertyShimmer extends StatelessWidget {
  const THorizontalPropertyShimmer({super.key, this.itemCount = 4});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
          itemBuilder: (_,__) =>  const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              //Image
                TShimmerEffect(width: 120, height: 120),
              SizedBox(width: TSizes.spaceBtwItems,),

              //Text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: TSizes.spaceBtwItems / 2,),

                  ],
                )
            ],
          ),
          separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems,),
          itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
