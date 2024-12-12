import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:realestateapi/screen/accounts/reset_password.dart';
import 'package:realestateapi/utils/network/network_manager.dart';
import 'package:realestateapi/utils/popups/fullscreen_loaders.dart';
import 'package:realestateapi/utils/popups/loaders.dart';
import 'package:realestateapi/utils/repository/authentication_repository.dart';
import 'package:realestateapi/utils/theme/custom_themes/image_strings.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try{
      TFullScreenLoader.openLoadingDialog('Processing Your Request', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if(!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      TFullScreenLoader.stopLoading();
      
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link sent to you email to reset your Password'.tr);
      
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  
}