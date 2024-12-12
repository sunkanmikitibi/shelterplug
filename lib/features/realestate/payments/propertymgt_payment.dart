import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:realestateapi/common/widget/appbar/appbar.dart';
import 'package:realestateapi/common/widget/section_heading.dart';
import 'package:realestateapi/controllers/plans.dart';
import 'package:realestateapi/features/personalization/controllers/user_controller.dart';
import 'package:realestateapi/features/realestate/payments/payment_success.dart';

import '../../../model/plan.dart';
import '../../../utils/popups/loaders.dart';
import '../../../utils/theme/custom_themes/sizes.dart';

class PropertyMgtPayment extends StatefulWidget {
  const PropertyMgtPayment({super.key});

  @override
  State<PropertyMgtPayment> createState() => _PropertyMgtPaymentState();
}

class _PropertyMgtPaymentState extends State<PropertyMgtPayment> {
  final planController = Get.put(PlanController());
  final userController = Get.put(UserController());
  final String newValue = "";

  String successMessage = '';

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
      Get.to(() => const PropertyMgtPayment(),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Property Management', overflow: TextOverflow.ellipsis,),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: planController.planKey,
          child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace,), child: Column(
            children: [
              const TSectionHeading(
                title: 'Select a Plan',
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems,),
              FutureBuilder<List<Plan>>(
                  future: planController.getPropertyMgtPlans(),
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
          ),),
        ),
      ),
    );
  }
}
