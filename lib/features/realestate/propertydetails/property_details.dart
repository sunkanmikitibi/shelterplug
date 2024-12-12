import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';
import 'package:realestateapi/common/widget/circular_image.dart';
import 'package:realestateapi/features/realestate/models/property_model.dart';
import 'package:realestateapi/utils/theme/custom_themes/image_strings.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/property_image_slider.dart';

class PropertyDetailsScreen extends StatelessWidget {
  const PropertyDetailsScreen({super.key, required this.property});

  final PropertyModel property;

  @override
  Widget build(BuildContext context) {
    final networkImage = property.user!.profilePicture!;
    final image =
        networkImage.isNotEmpty ? networkImage : TImages.userProfilePix;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(property.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TPropertyImageSlider(
              property: property,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  Text(
                    property.propertyAddress!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  Text(
                    NumberFormat.compactCurrency(
                      decimalDigits: 2,
                      symbol: 'N',
                    ).format(property.amount),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  const Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  Text(property.description!),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: TSizes.lg),
                        decoration: const BoxDecoration(
                            border: Border(
                                right:
                                    BorderSide(width: 1, color: Colors.grey))),
                        child: Column(
                          children: [
                            const Text('Bathrooms'),
                            const SizedBox(
                              height: TSizes.sm,
                            ),
                            Text(property.bathrooms)
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: TSizes.lg),
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            const Text('Bedrooms'),
                            const SizedBox(
                              height: TSizes.sm,
                            ),
                            Text(property.bedrooms)
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: TSizes.lg),
                        child: Column(
                          children: [
                            const Text('Kitchen'),
                            const SizedBox(
                              height: TSizes.sm,
                            ),
                            Text(property.kitchens!)
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        TCircularImage(
                          height: 100,
                          width: 100,
                          image: image,
                          isNetworkImage: networkImage.isNotEmpty,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                                '${property.user!.firstName} ${property.user!.lastName}'),
                          ],
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _laucherButton(
                              title: 'Call',
                              icon: Iconsax.call,
                              onPressed: () async {
                                Uri uri =
                                    Uri.parse('tel:${property.user!.phone}');
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri);
                                } else {
                                  throw 'Could not launch $uri';
                                }
                              },
                            ),
                            const SizedBox(
                              width: TSizes.spaceBtwItems,
                            ),
                            _laucherButton(
                                title: 'Message',
                                icon: Iconsax.message,
                                onPressed: () async {
                                  Uri uri =
                                      Uri.parse('sms:${property.user!.phone}');
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri);
                                  } else {
                                    throw 'Could not launch $uri';
                                  }
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _laucherButton({
    required String title,
    required IconData icon,
    required Function() onPressed,
  }) {
    return SizedBox(
        height: 55,
        width: 120,
        child: Center(
          child: ElevatedButton(
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon),
                const SizedBox(
                  width: TSizes.spaceBtwItems / 2,
                ),
                Text(title),
              ],
            ),
          ),
        ));
  }
}
