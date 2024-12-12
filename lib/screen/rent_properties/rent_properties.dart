import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/screen/rent_properties/rent_details.dart';
import 'package:realestateapi/screen/rent_properties/widgets/single_property.dart';


import '../../model/property.dart';

class RentPropertyPage extends StatefulWidget {
  const RentPropertyPage({super.key});

  @override
  State<RentPropertyPage> createState() => _RentPropertyPageState();
}

class _RentPropertyPageState extends State<RentPropertyPage> {

  @override
  Widget build(BuildContext context) {
    final rentList = Property.getRentProperties();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Properties For Rent"),
      ),
      body: ListView.builder(
          itemCount: rentList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                debugPrint(rentList[index].title);
                Get.to(() => RentDetailsScreen(property: rentList[index]));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                        SingleProperty(property: rentList[index]),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
