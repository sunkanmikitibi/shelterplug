import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:realestateapi/common/widget/success_screen/success_screen.dart';
import 'package:realestateapi/utils/popups/loaders.dart';

import '../../../utils/repository/authentication_repository.dart';

class VerifyEmailController extends GetxController {
static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification Link
sendEmailVerification() async {
  try {
    await AuthenticationRepository.instance.sendEmailVerification();
    TLoaders.successSnackBar(title: 'Email Sent', message: 'Please Check you inbox and verify the email');
  } catch (e) {
    TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  }
}
/// Timer to automatically redirect on Email Verification
setTimerForAutoRedirect()  {
  Timer.periodic(const Duration(seconds: 2), (timer) async { 
    await FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if(user?.emailVerified ?? false) {
      timer.cancel();
      Get.off(() => const SuccessScreen());
    }
  });
}
/// Manually Check if Email is verified
checkEmailVerification() async {
  final currentUser = FirebaseAuth.instance.currentUser;
  if(currentUser != null && currentUser.emailVerified) {
    
  }
}
} 