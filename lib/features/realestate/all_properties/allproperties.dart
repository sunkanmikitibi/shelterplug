import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/common/widget/shimmers/vertical_property_shimmer.dart';
import 'package:realestateapi/features/realestate/controllers/all_properties_controller.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

import '../../../common/widget/appbar/appbar.dart';
import '../models/property_model.dart';
import 'widgets/sortable_properties.dart';

class AllProperties extends StatelessWidget {
  const AllProperties({super.key, this.query, this
  .futureMethod, required this.title});

  final String title;
  final Query? query;
  final Future<List<PropertyModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllPropertiesController());
    return Scaffold(
      appBar: TAppBar(title: Text(title), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchPropertiesByQuery(query),
            builder: (context, snapshot) {
              const loader = TVerticalPropertyShimmer();

              if(snapshot.connectionState == ConnectionState.waiting) {
                return loader;
              }

              if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('No Property Found'),
                );
              }

              if(snapshot.hasError) {
                return const Center(
                  child: Text('Something went wrong...Please Try again'),
                );
              }

              final properties = snapshot.data!;

              return TSortableProperties(properties: properties,);
            }
          ),
        ),
      ),
    );
  }
}

