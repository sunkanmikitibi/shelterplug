import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:realestateapi/navigation_menu.dart'; 


class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();
  

  //Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs; 

  //Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  //Jump to the specific dot selected page.
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  //Update Current Index & jump to the next Page
  void nextPage() {
    if(currentPageIndex.value == 2) {
      //Get.to(() => const LoginScreen());
      final storage = GetStorage();
      storage.write('isFirstTime', false);
      Get.offAll(() => const NavigationMenu());
    } else {
      int page = currentPageIndex.value + 1 ;
      pageController.jumpToPage(page);
    }
  }

  //Update Current Index & Jump to the Last Page
  void skipPage() {
      currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}