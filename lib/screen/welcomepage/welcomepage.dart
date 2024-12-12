import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/common/widget/primary_header_container.dart';
import 'package:realestateapi/common/widget/section_heading.dart';
import 'package:realestateapi/features/realestate/all_properties/allproperties.dart';
import 'package:realestateapi/features/realestate/controllers/property_controller.dart';
import 'package:realestateapi/screen/welcomepage/widgets/homecategory.dart';
import 'package:realestateapi/screen/welcomepage/widgets/promo_slider.dart';
import 'package:realestateapi/utils/theme/custom_themes/image_strings.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';
import '../../features/realestate/widgets/featured_rent_properties.dart';
import '../../features/realestate/widgets/featured_sale_properties.dart';
import '../../features/realestate/widgets/shortlets.dart';
import '../../utils/constants/color.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/search_container.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PropertyController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header here
            TPrimaryHeaderContainer(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    const THomeAppBar(),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    GestureDetector(
                      onTap: () => Get.to(
                        () => AllProperties(
                          title: 'All Properties',
                          query: FirebaseFirestore.instance.collection('Propertys').where('IsFeatured', isEqualTo: true).limit(6),
                          futureMethod: controller.fetchAllProperties(),
                        ),
                      ),
                      child: const TSearchContainer(
                        showBackground: true,
                        text: 'Search Location',
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    // const SearchInput(),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: TSizes.defaultSpace,
                      ),
                      child: Column(
                        children: [
                          TSectionHeading(
                            title: 'Categories',
                            showActionButton: false,
                            textColor: TColors.light,
                          ),
                          SizedBox(
                            height: TSizes.spaceBtwItems,
                          ),

                          // Categories
                          THomeCategories()
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: TSizes.defaultSpace,
                      vertical: TSizes.defaultSpace,
                    ),
                    child: TPromoSlider(
                      banners: [
                        TImages.promobanner1,
                        TImages.promobanner2,
                        TImages.promobanner3,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  FeaturedSaleProperties(),
                  SizedBox(
                    height: TSizes.spaceBtwSections / 2,
                  ),
                  FeaturedRentProperty(),
                  SizedBox(
                    height: TSizes.spaceBtwSections / 2,
                  ),
                  TShortletsProperties(),
                  SizedBox(
                    height: TSizes.spaceBtwSections / 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
