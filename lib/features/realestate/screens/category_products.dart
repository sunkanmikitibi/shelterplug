import 'package:flutter/material.dart';
import 'package:realestateapi/common/layout/grid_layout.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';
import 'package:realestateapi/common/widget/home_banner.dart';
import 'package:realestateapi/common/widget/property/property_card_vertical.dart';
import 'package:realestateapi/common/widget/section_heading.dart';
import 'package:realestateapi/common/widget/shimmers/vertical_property_shimmer.dart';
import 'package:realestateapi/features/realestate/controllers/category_controller.dart';
import 'package:realestateapi/utils/theme/custom_themes/image_strings.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

import '../models/category_model.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Properties for ${category.name} '),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TRoundedBanner(
                imageUrl: TImages.promobanner1,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Column(
                children: [
                  TSectionHeading(
                    title: category.name,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  FutureBuilder(
                      future: controller.getCategoryProperties(
                          categoryId: category.id),
                      builder: (context, snapshot) {

                        if(snapshot.hasData) {
                          final properties = snapshot.data!;
                          if(properties.isEmpty) {
                            return const Center(
                              child: Text('No Property yet for this Category'),
                            );
                          }
                          return TGridLayout(
                              itemCount: properties.length,
                              itemBuilder: (_, index) => TPropertyCardVertical(
                                  property: properties[index]));
                        } else {
                          return const TVerticalPropertyShimmer();
                        }



                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
