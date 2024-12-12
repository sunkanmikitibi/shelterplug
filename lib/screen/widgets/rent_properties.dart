import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/screen/rent_properties/rent_details.dart';
import 'package:realestateapi/screen/widgets/property_item.dart';

import '../../model/property.dart';

class RentProperties extends StatefulWidget {
  const RentProperties({super.key});

  @override
  State<RentProperties> createState() => _RentPropertiesState();
}

class _RentPropertiesState extends State<RentProperties> {
  final rentList = Property.getRentProperties();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 230,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            itemCount: rentList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(
                    () => RentDetailsScreen(
                      property: rentList[index],
                    ),
                  );
                },
                child: PropertyItem(
                  properties: rentList[index],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
          ),
        )
      ],
    );
  }
}
