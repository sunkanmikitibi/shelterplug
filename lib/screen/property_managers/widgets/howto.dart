import 'package:flutter/material.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

class PropertyMgtDetails extends StatelessWidget {
  const PropertyMgtDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      width: double.infinity,
      decoration: const BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "How it Works?",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const Text("Submit your details"),
          const Text("Our Experts will Call you"),
          const Text("Dedicated property manager manages your property"),
          const Text("Flexible payment options and online dashboards"),
        ],
      ),
    );
  }
}
