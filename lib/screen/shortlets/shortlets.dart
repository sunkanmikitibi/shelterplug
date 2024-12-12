import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:realestateapi/utils/constants/colours.dart';
import 'package:realestateapi/utils/constants/helpers/helper_functions.dart';
import 'package:realestateapi/screen/shortlets/shortlet_details.dart';
import 'package:realestateapi/data/services/rent_services.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

import '../../model/properties.dart';

class ShortletScreen extends StatefulWidget {
  const ShortletScreen({super.key});

  @override
  State<ShortletScreen> createState() => _ShortletScreenState();
}

class _ShortletScreenState extends State<ShortletScreen> {
  List<Property>? shortlets;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getShortlets();
  }

  getShortlets() async {
    shortlets = await RentServices().getRentProperties();

    if (shortlets != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
            height: 200,
            child: Visibility(
              visible: isLoading,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: shortlets?.length ?? 0,
                itemBuilder: (context, index) {
                  final amount = int.parse(shortlets![index].amount);
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShortletDetailsPage(
                                    property: shortlets![index],
                                  )));
                    },
                    child: SizedBox(
                      width: 200,
                      child: Card(
                        color: dark ? kPrimaryDark : kPrimaryLight,
                        elevation: 0,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 200,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(
                                      10,
                                    ),
                                    topRight: Radius.circular(
                                      10,
                                    )),
                                child: CachedNetworkImage(
                                  imageUrl: shortlets![index].image,
                                  width: 200,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  width: 250,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        shortlets?[index].title ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        shortlets?[index].propertyAddress ?? '',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        NumberFormat.compactCurrency(
                                          locale: 'en-NG',
                                          symbol: '\u{20A6}', // Naira Symbol
                                          decimalDigits: 2,
                                        ).format(amount),
                                        style:
                                            Theme.of(context).textTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  width: 3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
