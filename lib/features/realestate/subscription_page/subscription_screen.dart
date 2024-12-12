import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';
import 'package:realestateapi/common/widget/section_heading.dart';
import 'package:realestateapi/features/realestate/payments/home_interior_payment.dart';
import 'package:realestateapi/features/realestate/payments/propertymgt_payment.dart';
import 'package:realestateapi/utils/theme/custom_themes/sizes.dart';
import '../payments/agent_developer.dart';
import '../payments/developer_payment.dart';
import 'widgets/subscription_item_screen.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Subscriptions'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TSubscriptionItem(
                title: 'Developer',
                price: '250k - 850k / year',
                onPressed: () => showModalBottomSheet(
                    context: context,
                    builder: ((context) {
                      return Padding(
                        padding: const EdgeInsets.all(TSizes.defaultSpace),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Developer Subscription Plans',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwItems,
                            ),
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
                              trailing: const Icon(Iconsax.arrow_right),
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
                              trailing: const Icon(Iconsax.arrow_right),
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
                              trailing: const Icon(Iconsax.arrow_right),
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwItems,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: 150,
                                    child: ElevatedButton(
                                        onPressed: () => Get.to(
                                            () => const DeveloperPaymentPage()),
                                        child: const Text('Subscribe Now!!!'))),
                                SizedBox(
                                    width: 150,
                                    height: 50,
                                    child: OutlinedButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Cancel'))),
                              ],
                            ),
                          ],
                        ),
                      );
                    })),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TSubscriptionItem(
                title: 'Home Interior',
                price: '250k - 1m / year',
                onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: ((context) => Padding(
                        padding: const EdgeInsets.all(TSizes.defaultSpace),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TSectionHeading(
                              title: "Home Interior Plans",
                              showActionButton: false,
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwItems,
                            ),
                            SizedBox(
                              height: 250,
                              child: ListView(
                                children: [
                                  ListTile(
                                    title: Text(
                                      '1 Year Plan',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    subtitle: Text(NumberFormat.compactCurrency(
                                      locale: 'en-NG',
                                      decimalDigits: 2,
                                      symbol: 'N',
                                    ).format(1000000)),
                                    onTap: () {
                                      return debugPrint('850000');
                                    },
                                    trailing: const Icon(Iconsax.arrow_right),
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwItems,
                                  ),
                                  ListTile(
                                    title: Text(
                                      '6 Months Plan',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    subtitle: Text(NumberFormat.compactCurrency(
                                      locale: 'en-NG',
                                      decimalDigits: 2,
                                      symbol: 'N',
                                    ).format(550000)),
                                    onTap: () {
                                      return debugPrint('550000');
                                    },
                                    trailing: const Icon(Iconsax.arrow_right),
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwItems,
                                  ),
                                  ListTile(
                                    title: Text(
                                      '3 Months Plan',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    subtitle: Text(NumberFormat.compactCurrency(
                                      locale: 'en-NG',
                                      decimalDigits: 2,
                                      symbol: 'N',
                                    ).format(250000)),
                                    onTap: () {
                                      return debugPrint('250000');
                                    },
                                    trailing: const Icon(Iconsax.arrow_right),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: 150,
                                    child: ElevatedButton(
                                        onPressed: () =>  Get.to(() => const HomeInteriorPayment(),),
                                        child: const Text('Subscribe Now!!!'),),),
                                SizedBox(
                                    width: 150,
                                    height: 50,
                                    child: OutlinedButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Cancel'))),
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TSubscriptionItem(
                title: 'Property Mgt.',
                price: '250k - 750k',
                onPressed: () => showModalBottomSheet(
                    context: context,
                    builder: ((context) => Padding(
                          padding: const EdgeInsets.all(TSizes.defaultSpace),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TSectionHeading(
                                title: "Property Mgt Plans",
                                showActionButton: false,
                              ),
                              const SizedBox(
                                height: TSizes.spaceBtwItems,
                              ),
                              SizedBox(
                                height: 250,
                                child: ListView(
                                  children: [
                                    ListTile(
                                      title: Text(
                                        '1 Year Plan',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      subtitle: Text(
                                        NumberFormat.compactCurrency(
                                          locale: 'en-NG',
                                          decimalDigits: 2,
                                          symbol: 'N',
                                        ).format(750000),
                                      ),
                                      onTap: () {
                                        return debugPrint('750000');
                                      },
                                      trailing: const Icon(Iconsax.arrow_right),
                                    ),
                                    const SizedBox(
                                      height: TSizes.spaceBtwItems,
                                    ),
                                    ListTile(
                                      title: Text(
                                        '6 Months Plan',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      subtitle:
                                          Text(NumberFormat.compactCurrency(
                                        locale: 'en-NG',
                                        decimalDigits: 2,
                                        symbol: 'N',
                                      ).format(400000)),
                                      onTap: () {
                                        return debugPrint('400000');
                                      },
                                      trailing: const Icon(Iconsax.arrow_right),
                                    ),
                                    const SizedBox(
                                      height: TSizes.spaceBtwItems,
                                    ),
                                    ListTile(
                                      title: Text(
                                        '3 Months Plan',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      subtitle:
                                          Text(NumberFormat.compactCurrency(
                                        locale: 'en-NG',
                                        decimalDigits: 2,
                                        symbol: 'N',
                                      ).format(250000)),
                                      onTap: () {
                                        return debugPrint('250000');
                                      },
                                      trailing: const Icon(Iconsax.arrow_right),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: 150,
                                      child: ElevatedButton(
                                          onPressed: () => Get.to(() => const PropertyMgtPayment(),),
                                          child:
                                              const Text('Subscribe Now!!!'))),
                                  SizedBox(
                                      width: 150,
                                      height: 50,
                                      child: OutlinedButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('Cancel'))),
                                ],
                              ),
                            ],
                          ),
                        ))),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              TSubscriptionItem(
                title: 'Agent',
                price: '40k - 150k / year',
                onPressed: () => showModalBottomSheet(
                    context: context,
                    builder: ((context) => Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: Column(
                        children: [
                          const TSectionHeading(
                            title: 'Agent Plan',
                            showActionButton: false,
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwItems,
                          ),
                          SizedBox(
                            height: 250,
                            child: ListView(
                              children: [
                                ListTile(
                                  title: Text(
                                    '1 Year Plan',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge,
                                  ),
                                  subtitle: Text(NumberFormat.compactCurrency(
                                    locale: 'en-NG',
                                    decimalDigits: 2,
                                    symbol: 'N',
                                  ).format(150000)),
                                  onTap: () {
                                    return debugPrint('150000');
                                  },
                                  trailing: const Icon(Iconsax.arrow_right),
                                ),
                                const SizedBox(
                                  height: TSizes.spaceBtwItems,
                                ),
                                ListTile(
                                  title: Text(
                                    '6 Months Plan',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge,
                                  ),
                                  subtitle: Text(NumberFormat.compactCurrency(
                                    locale: 'en-NG',
                                    decimalDigits: 2,
                                    symbol: 'N',
                                  ).format(80000)),
                                  onTap: () {
                                    return debugPrint('80000');
                                  },
                                  trailing: const Icon(Iconsax.arrow_right),
                                ),
                                const SizedBox(
                                  height: TSizes.spaceBtwItems,
                                ),
                                ListTile(
                                  title: Text(
                                    '3 Months Plan',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge,
                                  ),
                                  subtitle: Text(NumberFormat.compactCurrency(
                                    locale: 'en-NG',
                                    decimalDigits: 2,
                                    symbol: 'N',
                                  ).format(40000)),
                                  onTap: () {
                                    return debugPrint('40000');
                                  },
                                  trailing: const Icon(Iconsax.arrow_right),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 150,
                                child: ElevatedButton(
                                  onPressed: () =>  Get.to(() => const AgentPaymentScreen(),),
                                  child: const Text('Subscribe Now!!!'),),),
                              SizedBox(
                                  width: 150,
                                  height: 50,
                                  child: OutlinedButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Cancel'))),
                            ],
                          ),
                        ],
                      ),
                    ))),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TSubscriptionItem(
                  title: 'Shortlets',
                  price: '150k - 500k / year',
                  onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: ((context) => const Padding(
                            padding: EdgeInsets.all(TSizes.defaultSpace),
                            child: Column(
                              children: [
                                TSectionHeading(
                                  title: 'Shortlets Plan',
                                  showActionButton: false,
                                )
                              ],
                            ),
                          )))),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TSubscriptionItem(
                title: 'Parkers & Movers',
                price: '150k - 500k / year',
                onPressed: () => showModalBottomSheet(
                    context: context,
                    builder: ((context) => const Padding(
                          padding: EdgeInsets.all(TSizes.defaultSpace),
                          child: Column(
                            children: [
                              TSectionHeading(title: 'Parkers and Movers', showActionButton: false,),
                            ],
                          ),
                        ))),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
