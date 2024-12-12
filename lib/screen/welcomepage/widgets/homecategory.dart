import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widget/shimmers/category_shimmer.dart';
import '../../../common/widget/vertical_image.dart';
import '../../../features/realestate/controllers/category_controller.dart';
import '../../../features/realestate/screens/category_products.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if (categoryController.isLoading.value) return const TCategoryShimmer();
      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No Data Found',
            style: Theme.of(context).textTheme.bodySmall!.apply(
                  color: Colors.white,
                ),
          ),
        );
      }
      return SizedBox(
        height: 100,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return TVerticalImageText(
              title: category.name,
              image: category.image,
              onTap: () => Get.to(() => CategoryProductsScreen(category: category,)),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 10,
            );
          },
        ),
      );
    });
  }
}
