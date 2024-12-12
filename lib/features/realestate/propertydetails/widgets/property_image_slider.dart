import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/common/widget/curved_edges_widget.dart';
import 'package:realestateapi/common/widget/home_banner.dart';
import 'package:realestateapi/features/realestate/controllers/images_controller.dart';
import 'package:realestateapi/features/realestate/models/property_model.dart';
import 'package:realestateapi/utils/constants/color.dart';
import 'package:realestateapi/utils/constants/helpers/helper_functions.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

import '../../../../common/widget/icons/t_favorite_icon.dart';

class TPropertyImageSlider extends StatelessWidget {
  const TPropertyImageSlider({super.key, required this.property});
  final PropertyModel property;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getPropertyImages(property);
    return TCurvedEdgesWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Obx(() {
                  final image = controller.selectedPropertyImage.value;
                  return InkWell(
                    onTap: () => controller.showEnlargeImage(image),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: image,
                      progressIndicatorBuilder: (_, __, downloadProgess) =>
                          Center(
                        child: CircularProgressIndicator(
                          value: downloadProgess.progress,
                          color: TColors.primary,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Positioned(
                right: 0,
                bottom: 30,
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Obx(() {
                        final imageSelected =
                            controller.selectedPropertyImage.value ==
                                images[index];
                        return TRoundedBanner(
                          imageUrl: images[index],
                          width: 80,
                          onPressed: () => controller.selectedPropertyImage.value = images[index],
                          isNetworkImage: true,
                          border: Border.all(
                            color: imageSelected
                                ? TColors.primary
                                : Colors.transparent,
                          ),
                        );
                      });
                    },
                    separatorBuilder: (_, __) => const SizedBox(
                      width: TSizes.spaceBtwItems,
                    ),
                    itemCount: images.length,
                  ),
                )),
            Positioned(
              top: 10,
              left: 20,
              child: property.categoryId == "1"
                  ? Chip(
                      label: Text(
                        'Rent',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      labelPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    )
                  : (property.categoryId == "2")
                      ? const Chip(
                          label: Text(
                            'Buy',
                          ),
                        )
                      : const Chip(
                          label: Text(
                            'Shortlets',
                          ),
                        ),
            ),
            Positioned(
              top: 10,
              right: 20,
              child: TFavoriteIcon(id: property.id),
            ),
          ],
        ),
      ),
    );
  }
}
