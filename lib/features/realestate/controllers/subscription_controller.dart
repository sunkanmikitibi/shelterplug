import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:get/get.dart';

class SubscriptionController extends GetxController {
  static SubscriptionController get instance => Get.find();

  final String publicKey = 'pk_test_b6ff1f21445cf2c860ca96b8ede9604e41a2642c';
  final plugin = PaystackPlugin();

  @override
  void onInit() {
    super.onInit();
    plugin.initialize(publicKey: publicKey);
  }


}
