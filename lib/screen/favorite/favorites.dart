import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:realestateapi/common/layout/grid_layout.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';
import 'package:realestateapi/common/widget/icons/t_circular_icon.dart';
import 'package:realestateapi/common/widget/property/property_card_vertical.dart';
import 'package:realestateapi/common/widget/shimmers/vertical_property_shimmer.dart';
import 'package:realestateapi/controllers/favorite_controller.dart';
import 'package:realestateapi/navigation_menu.dart';
import 'package:realestateapi/utils/animations/animation.dart';
import 'package:realestateapi/utils/theme/custom_themes/image_strings.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavoriteController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Saved Properties',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.offAll(() => const NavigationMenu()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Obx(
                () => FutureBuilder(
                    future: controller.favoriteProperties(),
                    builder: (context, snapshot) {
                      const loader = TVerticalPropertyShimmer();
                      final props = snapshot.data;
                      if (!snapshot.hasData ||
                          snapshot.data == null ||
                          snapshot.data!.isEmpty) {
                        return TAnimationLoaderWidget(
                          text: 'Whoops! Wishlist is empty...',
                          animation: TImages.docerAnimation,
                          showAction: true,
                          actionText: 'Let\'s Add some',
                          onActionPressed: () => Get.offAll(
                            () => const NavigationMenu(),
                          ),
                        );
                      }else if (snapshot.hasError) {
                        return const Center(
                          child: Text('No Data Found...Something went wrong!'),
                        );
                      } else if (snapshot.hasData) {
                        return TGridLayout(
                            itemCount: props!.length,
                            itemBuilder: (context, index) {
                              return TPropertyCardVertical(
                                  property: props[index]);
                            });
                      } else {
                        return loader;
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
