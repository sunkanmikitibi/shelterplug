import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:realestateapi/common/layout/grid_layout.dart';
import 'package:realestateapi/common/widget/property/property_card_vertical.dart';
import 'package:realestateapi/features/realestate/controllers/all_properties_controller.dart';
import 'package:realestateapi/features/realestate/models/property_model.dart';

import '../../../../utils/theme/custom_themes/sizes.dart';

class TSortableProperties extends StatelessWidget {
  const TSortableProperties({
    super.key, required this.properties,
  });

  final List<PropertyModel> properties;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllPropertiesController());
    controller.assignProperties(properties);
    return Column(
      children: [
        Row(
          children: [
            FilterChip(label: const Text('Rent'), onSelected: (selected){})
          ],
        ),
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          items: ['Title', 'Amount', 'Bedrooms', 'Bathrooms', 'Shortlets']
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
          onChanged: (value) {
            controller.sortProperties(value!);
          },
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        Obx(() {
         return TGridLayout(
              itemCount: controller.properties.length,
              itemBuilder: (_, index) => TPropertyCardVertical(
                property: controller.properties[index],
              ));
        }

        )
      ],
    );
  }
}
