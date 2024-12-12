import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:realestateapi/common/widget/icons/t_favorite_icon.dart';
import 'package:realestateapi/utils/constants/color.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';
import '../../../model/property.dart';

class SingleProperty extends StatelessWidget {
  final Property property;
  const SingleProperty({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            width: double.infinity,
            height: 200,
            child: Image(
              image: AssetImage(property.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Container(
            width: 100,
            padding:
            const EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1, 1),
                    blurRadius: 2.0,
                  )
                ],
                borderRadius: BorderRadius.circular(15),
                color: Colors.orange),
            child: Text(
              property.type,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 15,
                  color: TColors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
         Positioned(
          top: 10,
          right: 10,
          child: TFavoriteIcon(
            id: property.id.toString(),
          ),
        ),
        Positioned(
          left: 15,
          bottom: 55,
          child: Text(
           property.title,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: TSizes.defaultSpace,
        ),
        Positioned(
            left: 15,
            bottom: 35,
            child: Text(
             property.property_address,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            )),
        Positioned(
          left: 15,
          bottom: 15,
          child: Text(
            NumberFormat.currency(
              decimalDigits: 2,
              locale: "en_NG",
              symbol: "\u{20A6}",
            ).format(property.amount),
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
        ),
      ],
    );
  }
}
