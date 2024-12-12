import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';
import 'package:realestateapi/features/realestate/shortlets/shortlet_screen.dart';
import 'package:realestateapi/features/realestate/addproperty/addproperty.dart';
import 'package:realestateapi/screen/buyproperties/buyproperty.dart';
import 'package:realestateapi/screen/edge_services/edge_services/homeinteriors.dart';
import 'package:realestateapi/screen/parkersmovers/parkers.dart';
import 'package:realestateapi/screen/pgcoliving/pgcoliving.dart';
import 'package:realestateapi/screen/property_managers/propertymanagers.dart';
import 'package:realestateapi/screen/propertyvaluation/property_valuation_screen.dart';
import 'package:realestateapi/screen/rent_receipts/rent_agreement.dart';
import 'package:realestateapi/screen/rent_receipts/rent_receipts.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';
import 'widget/edge_widgets.dart';

class EdgeScreen extends StatefulWidget {
  const EdgeScreen({super.key});

  @override
  State<EdgeScreen> createState() => _EdgeScreenState();
}

class _EdgeScreenState extends State<EdgeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text(
          'Shelterplug Edge',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text('Shelterplug Services', style: Theme.of(context).textTheme.titleLarge,),
                const Padding(
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: SizedBox(
                    width: double.infinity,
                    height: 500,
                    child: TShelterPlugServices(),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TShelterPlugServices extends StatelessWidget {
  const TShelterPlugServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: TSizes.spaceBtwItems / 2,
      crossAxisSpacing: TSizes.spaceBtwItems / 2,
      crossAxisCount: 3,
      padding: EdgeInsets.zero,
      children: [
        EdgeService(
          onTapped: () => Get.to(() => const RentAgreement()),
          imageUrl: "assets/icons/rent.png",
          title: "Rent Agreements",
        ),
        EdgeService(
          onTapped: () => Get.to(() => const ParkersMoverScreen()),
          imageUrl: "assets/images/parkers.png",
          title: "Parkers & Movers",
        ),
        const EdgeService(
          imageUrl: "assets/images/shelter.png",
          title: "Edge Premium",
        ),
        EdgeService(
          onTapped: () => Get.to(() => const HomeInterior()),
          imageUrl: "assets/icons/homeint.png",
          title: "Home Interiors",
        ),
        EdgeService(
          onTapped: () => Get.to(() => const PropertyManagers()),
          imageUrl: "assets/icons/propertymanagers.png",
          title: "Property Managers",
        ),
        EdgeService(
          imageUrl: "assets/images/776927.png",
          title: "Buy Property",
          onTapped: () => Get.to(() => const BuyPropertyScreen()),
        ),
        EdgeService(
          onTapped: () => Get.to(() => const RentReceiptScreen()),
          imageUrl: "assets/images/rent.png",
          title: "Rent Receipts",
        ),
        EdgeService(
          onTapped: ()=> Get.to(() => const ShortLetScreen()),
          imageUrl: "assets/images/shorts.png",
          title: "Shortlet Properties",
        ),
        EdgeService(
          onTapped: () => Get.to(() => const PgCoLivingScreen(),),
          imageUrl: "assets/images/pgco.png",
          title: "PG & Co-Living",
        ),
        EdgeService(
          onTapped: () => Get.to(() => const AddPropertyScreen()),
          imageUrl: "assets/icons/add-property.png",
          title: "Add Property",
        ),
        EdgeService(
          onTapped: () => Get.to(() => const PropertyValuationScreen()),
          imageUrl: "assets/icons/propertyvaluation.png",
          title: "Property Valuation",
        ),
      ],
    );
  }
}
