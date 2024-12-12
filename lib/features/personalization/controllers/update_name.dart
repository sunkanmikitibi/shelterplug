import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapi/utils/network/network_manager.dart';
import 'package:realestateapi/utils/popups/loaders.dart';

import '../../../screen/profile/profile_screen.dart';
import '../../../utils/popups/fullscreen_loaders.dart';
import '../../../utils/repository/user_repository.dart';
import '../../../utils/theme/custom_themes/image_strings.dart';
import 'user_controller.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  // Variables
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepo = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> upDateUserName() async {
    try{
      TFullScreenLoader.openLoadingDialog('We Are Updating Your Information', TImages.docerAnimation);

      //check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        TFullScreenLoader.stopLoading();
        Get.snackbar('Internet Connection', 'The Internet is Down!');
        return;
      }

      //form validation
      if(!updateUserNameKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Update Users First & last name in the Firebase FireStore

      Map<String, dynamic> name = {'FirstName' : firstName.text.trim(), 'LastName' : lastName.text.trim()};
      await userRepo.updateSingleField(name);

      //Update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      TFullScreenLoader.stopLoading();
      
      //Show Success Message
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your Name has Been Updated');
      
      Get.off(() => const ProfileScreen());
    } catch (e) {
        TFullScreenLoader.stopLoading();
            TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}