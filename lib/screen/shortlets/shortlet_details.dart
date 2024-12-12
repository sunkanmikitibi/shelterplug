import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';
import 'package:realestateapi/model/properties.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

class ShortletDetailsPage extends StatelessWidget {
  const ShortletDetailsPage({super.key, required this.property});
  final Property property;

  @override
  Widget build(BuildContext context) {
    final amount = int.parse(property.amount);
    return Scaffold(
      appBar: const TAppBar(
        title: Text("Shortlets"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: CachedNetworkImage(
                    imageUrl: property.image,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    width: 350,
                    color: Colors.grey.withOpacity(0.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          property.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          property.location,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          NumberFormat.compactCurrency(
                            decimalDigits: 2,
                            locale: 'en-NG',
                            symbol: '\u{20A6}',
                          ).format(amount),
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                color: Colors.white,
                              ),
                        ),
                        Row(
                          children: [
                            Text(
                              property.size,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const Text(
                              ' sqrt/M',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 120,
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              color: Colors.grey.shade50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/icons/bath.png",
                        width: 32,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Text(property.noOfBathrooms),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/icons/bath.png",
                        width: 32,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Text(property.noOfBedrooms),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    Bidi.stripHtmlIfNeeded(property.description),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Contact User'),
                      )),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () {},
                              child: const Text('Add to Favorite')))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
