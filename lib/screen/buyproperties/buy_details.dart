import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';
import 'package:realestateapi/utils/constants/color.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

import '../../features/realestate/models/property_model.dart';

class BuyDetails extends StatelessWidget {
  const BuyDetails({super.key, required this.property});
  final PropertyModel property;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TAppBar(
              title:  Text('3 Bedroom'),
              showBackArrow: true,
            ),
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    property.image!,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    top: 15,
                    right: 15,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Iconsax.heart,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Iconsax.share,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
                Positioned(
                    bottom: 30,
                    left: 20,
                    child: Row(
                      children: [
                        Text(
                          '${property.propertyAddress} ',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
                Positioned(
                  bottom: 10,
                  left: 20,
                  child: Text(
                    NumberFormat.compactCurrency(
                      locale: 'en-NG',
                      decimalDigits: 2,
                      symbol: '\u{20A6}',
                    ).format(property.amount),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .apply(color: TColors.white),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(
                TSizes.defaultSpace,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(property.bedrooms.toString()),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: 28,
                              height: 28,
                              child: SvgPicture.asset('assets/icons/bed.svg'),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(property.bathrooms.toString()),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: 28,
                              height: 28,
                              child: Image.asset('assets/icons/bath.png'),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final image = property.propertyImages![index];
                            return Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Image.asset(
                                image,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                          separatorBuilder: (_, index) => const SizedBox(
                                width: 5,
                              ),
                          itemCount: property.propertyImages!.length),
                    )
                  ]),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3)),
                height: 200,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/person10.jpg',
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
