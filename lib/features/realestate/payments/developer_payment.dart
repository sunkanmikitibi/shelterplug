import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';
import 'package:realestateapi/common/widget/section_heading.dart';
import 'package:realestateapi/controllers/plans.dart';
import 'package:realestateapi/features/realestate/payments/payment_success.dart';
import 'package:realestateapi/model/plan.dart';
import 'package:realestateapi/utils/popups/loaders.dart';
import '../../../utils/theme/custom_themes/sizes.dart';
import '../../personalization/controllers/user_controller.dart';

class DeveloperPaymentPage extends StatefulWidget {
  const DeveloperPaymentPage({super.key});

  @override
  State<DeveloperPaymentPage> createState() => _DeveloperPaymentPageState();
}

class _DeveloperPaymentPageState extends State<DeveloperPaymentPage> {

  final String newValue = "";

  String successMessage = '';
  PlanController planController = Get.put(PlanController());
  UserController userController = Get.put(UserController());

  makePayment() async {
    int price = int.parse(planController.plan!) * 100;
    Charge charge = Charge()
      ..amount = price
      ..reference = 'ref_${DateTime.now().millisecondsSinceEpoch}'
      ..email = userController.user.value.email
      ..currency = "NGN";
    CheckoutResponse response = await planController.plugin.checkout(
      context,
      method: CheckoutMethod.card,
      charge: charge,
    );
    //debugPrint(response);
    if (response.status == true) {
      //print(response);
      successMessage = 'Payment was successful. Ref: ${response.reference}';
      TLoaders.successSnackBar(
          title: 'Payment Successful', message: successMessage);
      Get.to(() => PaymentSuccess(successMessage: successMessage));
    } else {
      debugPrint(response.message);
      TLoaders.errorSnackBar(title: 'Oh Snap', message: response.message);
      Get.to(() => const DeveloperPaymentPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TAppBar(
          title: Text('Developer Subscription Payment'),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Form(
              key: planController.planKey,
              child: Column(
                children: [

                  const TSectionHeading(
                    title: 'Select a Plan',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  FutureBuilder<List<Plan>>(
                      future: planController.getDeveloperPlans(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return DropdownButtonFormField(
                            value: planController.plan,
                            hint: const Text('Select Plan'),
                            items: snapshot.data!
                                .map(
                                  (e) => DropdownMenuItem(
                                    value:  e.amount,
                                    child: Text(e.name),
                                  ),
                                )
                                .toList(),
                            onChanged: (String? value) {
                              setState(() {
                               planController.plan =  value!;

                               debugPrint(planController.plan);

                              });
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Iconsax.money,
                              ),
                            ),
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      }),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => makePayment(),
                        child: const Text('Make Payment Now')),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
