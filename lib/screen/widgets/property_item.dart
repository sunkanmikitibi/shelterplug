import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:realestateapi/common/widget/icons/t_favorite_icon.dart';
import 'package:realestateapi/utils/constants/colours.dart';
import 'package:realestateapi/utils/constants/helpers/helper_functions.dart';
import 'package:realestateapi/utils/constants/color.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';

import '../../model/property.dart';

class PropertyItem extends StatelessWidget {
  final Property properties;
  const PropertyItem({
    super.key,
    required this.properties,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        Container(
          height: 220,
          width: 180,
          decoration: BoxDecoration(
            color: dark ? kPrimaryDark : kPrimaryLight,
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Stack(children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(
                        10,
                      ),
                      topRight: Radius.circular(
                        10.0,
                      ),
                    ),
                    child: Image.asset(
                      properties.image,
                      fit: BoxFit.cover,
                      width: 180,
                    ),
                  ),
                  Positioned(
                    top: 15,
                    left: 5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.defaultSpace,
                        vertical: 5,
                      ),
                      decoration:
                          BoxDecoration(color: TColors.light.withOpacity(0.5)),
                      child: Text(properties.type),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: TFavoriteIcon(
                      id: properties.id.toString(),
                    ),
                  ),
                ]),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    top: 5.0,
                    right: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              properties.title,
                              style: Theme.of(context).textTheme.bodySmall,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              properties.property_address,
                              style: Theme.of(context).textTheme.bodySmall,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        NumberFormat.compactCurrency(
                          locale: 'en-NG',
                          decimalDigits: 2,
                          symbol: '\u{20A6}',
                        ).format(properties.amount),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
