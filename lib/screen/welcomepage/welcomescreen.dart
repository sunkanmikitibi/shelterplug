import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/utils/constants/helpers/helper_functions.dart';
import 'package:realestateapi/model/category.dart';
import 'package:realestateapi/screen/buyproperties/buyproperty.dart';
import 'package:realestateapi/screen/rent_properties/rent_properties.dart';
import 'package:realestateapi/screen/searchpage/search_page.dart';
import 'package:realestateapi/screen/shortlets_page.dart';
import 'package:realestateapi/screen/widgets/category_title.dart';
import 'package:realestateapi/screen/widgets/rent_properties.dart';
import 'package:realestateapi/screen/widgets/search_input.dart';
import 'package:realestateapi/screen/shortlets/shortlets.dart';
import 'package:realestateapi/screen/widgets/topdeveloper.dart';
import 'package:realestateapi/utils/theme/custom_themes/image_strings.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';
import '../../model/property.dart';
import 'widgets/category_list_item.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/promo_slider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final List<PropertyCategory> categories = PropertyCategory.allCategory;
  final buyProperties = Property.buyProperties();

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: [
            Colors.blue.shade900,
            Colors.blue.shade600,
            Colors.blue.shade300
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const THomeAppBar(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SearchInput(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    height: 50,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryListItem(
                            title: categories[index].title,
                            onTap: () {
                              Get.to(() => const SearchPage());
                            },
                          );
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
            ]),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: dark ? Colors.grey.shade800 : Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(
                    20,
                  ),
                  topRight: Radius.circular(
                    20,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: ListView(
                  children: [
                    CategoryTitle(
                      leftText: 'Rent',
                      rightText: 'View All',
                      onTapped: () => Get.to(
                        () => const RentPropertyPage(),
                      ),
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: RentProperties(),
                    ),

                    //banners
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Column(
                        children: [
                          const Padding(
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
                          const SizedBox(
                            height: TSizes.spaceBtwSections,
                          ),
                          CategoryTitle(
                            leftText: 'Buy',
                            rightText: 'View All',
                            onTapped: () => Get.to(
                              () => const BuyPropertyScreen(),
                            ),
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),

                    CategoryTitle(
                      leftText: 'Shortlets',
                      rightText: 'View all',
                      onTapped: () => Get.to(
                        () => const ShortletPage(),
                      ),
                    ),
                    const ShortletScreen(),
                    const SizedBox(
                      height: 20,
                    ),
                    CategoryTitle(
                      leftText: 'Top Developers',
                      rightText: 'View all',
                      onTapped: () {},
                    ),
                    const SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: TopDeveloperList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}


