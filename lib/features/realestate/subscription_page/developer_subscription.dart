import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';

import '../../../utils/theme/custom_themes/sizes.dart';

class DeveloperSubscriptionPage extends StatelessWidget {
  const DeveloperSubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TAppBar(
          title: Text('Developer\'s Plans'),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(
              TSizes.defaultSpace,
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    '1 Year Plan',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(NumberFormat.compactCurrency(
                    locale: 'en-NG',
                    decimalDigits: 2,
                    symbol: 'N',
                  ).format(850000)),
                  onTap: () {
                    return debugPrint('850000');
                  },
                ),
                ListTile(
                  title: Text(
                    '6 Months Plan',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    NumberFormat.compactCurrency(
                      locale: 'en-NG',
                      decimalDigits: 2,
                      symbol: 'N',
                    ).format(450000),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    '3 Months Plan',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    NumberFormat.compactCurrency(
                      locale: 'en-NG',
                      decimalDigits: 2,
                      symbol: 'N',
                    ).format(250000),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ));
  }
}
