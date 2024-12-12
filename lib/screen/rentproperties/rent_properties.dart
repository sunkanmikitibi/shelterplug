import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/common/layout/grid_layout.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';
import 'package:realestateapi/common/widget/property/property_card_vertical.dart';

import '../../features/realestate/controllers/home_property_controller.dart';

class RentPropertiesScreen extends StatelessWidget {
  const RentPropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePropertyController());
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Rent Properties'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            children: [
              TGridLayout(
                  itemCount: controller.allRentProperties.length,
                  itemBuilder: (context, index) {
                    return TPropertyCardVertical(
                        property: controller.allRentProperties[index]);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
