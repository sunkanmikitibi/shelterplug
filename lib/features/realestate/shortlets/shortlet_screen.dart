import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';
import 'package:realestateapi/common/widget/property/property_card_horizontal.dart';
import 'package:realestateapi/features/realestate/controllers/property_controller.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

import '../../../common/widget/shimmers/vertical_property_shimmer.dart';

class ShortLetScreen extends StatelessWidget {
  const ShortLetScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final controller = Get.put(PropertyController());
    return Scaffold(
      appBar: const TAppBar(
        title: Text('All Shortlets'),
        showBackArrow: true,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
             SizedBox(
               height: 700,
               child: Obx(() {
                 if (controller.isLoading.value) {
                   return const TVerticalPropertyShimmer();
                 }
                 if (controller.allShortLets.isEmpty) {
                   return Center(
                     child: Text('No Properties...',
                         style: Theme.of(context).textTheme.bodySmall),
                   );
                 }
                 return ListView.separated(
                   itemCount: controller.allShortLets.length,
                   itemBuilder: (context, index) {
                     return TPropertyCardHorizontal(property: controller.allShortLets[index]);
                   }, separatorBuilder: (BuildContext context, int index) { return const SizedBox(height: TSizes.sm,); },);
               }
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
