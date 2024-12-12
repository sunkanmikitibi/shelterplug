import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/common/layout/grid_layout.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';
import 'package:realestateapi/common/widget/property/property_card_vertical.dart';
import 'package:realestateapi/common/widget/shimmers/vertical_property_shimmer.dart';
import 'package:realestateapi/features/realestate/controllers/home_property_controller.dart';

import '../../utils/theme/custom_themes/sizes.dart';

class BuyPropertyScreen extends StatelessWidget {
  const BuyPropertyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePropertyController());
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Properties'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
          child: Column(
            children: [
              Obx(() { return TGridLayout(
                  itemCount: controller.allSaleProperties.length,
                  itemBuilder: (_, index) {
                    if(controller.isLoading.value) {
                      return const TVerticalPropertyShimmer();
                    }
                    if(controller.allSaleProperties.isEmpty) {
                      return Center(
                        child: Text(''
                            'No Properties', style: Theme.of(context).textTheme.bodySmall,),
                      );
                    }
                    return TPropertyCardVertical(
          
                        property: controller.allSaleProperties[index]);
                  } ); } ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
