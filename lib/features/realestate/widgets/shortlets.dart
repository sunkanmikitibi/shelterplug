
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/features/realestate/shortlets/shortlet_screen.dart';
import '../../../common/widget/section_heading.dart';
import '../../../utils/theme/custom_themes/sizes.dart';
import '../controllers/home_property_controller.dart';
import 'featured_shortlets_properties.dart';

class TShortletsProperties extends StatelessWidget {
  const TShortletsProperties({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePropertyController());
    return Column(
      children: [
        TSectionHeading(
            title: 'Shortlets',
          buttonTitle: 'View Shortlets',
          onPressed: () => Get.to(() => const ShortLetScreen()),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections / 2,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: 10,),
          height: 250,
          child: Obx(()
            {
              if(controller.isLoading.value) {
                return  const Center(child: CircularProgressIndicator(),);
              }
              if(controller.featuredShortLetProperties.isEmpty) {
                return const Center(
                  child: Text('No Shortlet Property'),
                );
              }
             return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.featuredShortLetProperties.length,
                itemBuilder: (context, index){
                  return TShortLetProperty(property: controller.featuredShortLetProperties[index],);
                }, separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 7,);
              },
              );
            }

          ),
        ),
      ],
    );
  }
}

