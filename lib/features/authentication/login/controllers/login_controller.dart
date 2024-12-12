 import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:realestateapi/features/personalization/controllers/user_controller.dart';
import 'package:realestateapi/navigation_menu.dart';
import 'package:realestateapi/utils/network/network_manager.dart';
import 'package:realestateapi/utils/popups/fullscreen_loaders.dart';
import 'package:realestateapi/utils/popups/loaders.dart';
import 'package:realestateapi/utils/repository/authentication_repository.dart';
import 'package:realestateapi/utils/theme/custom_themes/image_strings.dart';

class LoginController extends GetxController {
  //variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());
  /*
  @override
  void onInit() {
    super.onInit();
  }
  */


  @override
  void onReady() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');
  }

  Future<void> emailAndPasswordSignIn() async {
    try{
      TFullScreenLoader.openLoadingDialog('Logging you in', TImages.docerAnimation);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if(!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Save Data if Remember Me is Selected
      if(rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //Login user Email & Password Authentication
      //final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //Remove Loader
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const NavigationMenu());
    }catch (e) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
      try {
          TFullScreenLoader.openLoadingDialog('Logging you In....', TImages.docerAnimation);

          //check Internet Connection
        final isConnected = await NetworkManager.instance.isConnected();
        if(!isConnected) {
          TFullScreenLoader.stopLoading();
          Get.snackbar('Internet Connection', 'The Internet is Down!');
          return;
        }

        //Google Authentication
        final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

        //Save user Credentials
        userController.saveUserRecord(userCredentials);

        TFullScreenLoader.stopLoading();

        Get.offAll(() => const NavigationMenu());

      } catch(e) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      }
  }
}