import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:realestateapi/model/user_model.dart';
import 'package:realestateapi/screen/authentications/verifyemail/verify_email.dart';
import 'package:realestateapi/utils/popups/fullscreen_loaders.dart';
import 'package:realestateapi/utils/popups/loaders.dart';
import 'package:realestateapi/utils/repository/user_repository.dart';
import 'package:realestateapi/utils/theme/custom_themes/image_strings.dart';

import '../../../utils/network/network_manager.dart';
import '../../../utils/repository/authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  /// Variables
  final emailController = TextEditingController(); //controller for email input
  final lastnameController = TextEditingController();
  final firstnameController = TextEditingController();
  final usernameController = TextEditingController(); // username controller
  final phone = TextEditingController(); // phone number Controller
  final passwordController = TextEditingController(); //password Controller
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  final hidePassword = true.obs; //Observable for hiding and showing Password
  final privacyPolicyCheck = true.obs; //Observable for toggling privacy policy


  /// Sign up

  Future<void> signup() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog(
        'We are Processing your Information...',
        TImages.docerAnimation,
      );

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      } 

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }


      // Privacy Check Policy
      if (!privacyPolicyCheck.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In Order to create account, you must have to read and accept the Privacy Policy & Terms of use.');
        return;
      }
      // Register User in the firebase Authentication $ save user data in the firebase
      final userCredential =
          await AuthenticationRepository.instance.registerWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      // Save Authenticated user data in the Firebase FireStore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstnameController.text.trim(),
          lastName: lastnameController.text.trim(),
          username: usernameController.text.trim(),
          email: emailController.text.trim(),
          phone: phone.text.trim(),
          profilePicture: '');
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      TFullScreenLoader.stopLoading();


      // Show Success Message
      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Nice of you to Join us...we Have amazing offers for you'
      );

      //Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: emailController.text.trim(),));
    } catch (e) {

      TFullScreenLoader.stopLoading();


      // Show some generic error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
