import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/common/widget/circular_container.dart';
import 'package:realestateapi/common/widget/home_banner.dart';
import 'package:realestateapi/controllers/home_controller.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';
 

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: banners.map((url) => TRoundedBanner(imageUrl: url)).toList(),
          options: CarouselOptions(
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
            viewportFraction: 1,
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < banners.length; i++)
                TCircularContainer(
                  width: 20,
                  height: 4,
                  margin: const EdgeInsets.only(
                    right: 3,
                  ),
                  backgroundColor: controller.carousalCurrentIndex.value == i
                      ? Colors.lightBlue
                      : Colors.grey,
                ),
            ],
          ),
        )
      ],
    );
  }
}
