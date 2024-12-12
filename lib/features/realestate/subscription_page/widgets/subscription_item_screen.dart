import 'package:flutter/material.dart';

import '../../../../utils/constants/color.dart';
import '../../../../utils/theme/custom_themes/sizes.dart';

class TSubscriptionItem extends StatelessWidget {
  const TSubscriptionItem({
    super.key,
    required this.title,
    required this.price,
    this.onPressed,
  });

  final String title;
  final String price;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(TSizes.sm),
      decoration: const BoxDecoration(
          color: TColors.primary,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .apply(color: Colors.white),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Price'),
                    Text(price),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: TColors.light,
          ),
          Text(
            'Features',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onPressed,
              child: const Text('Get Plans'),
            ),
          ),
        ],
      ),
    );
  }
}
