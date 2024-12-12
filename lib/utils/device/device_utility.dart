
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TDeviceUtils {
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  //static bool isLandscapeOrientation(BuildContext context) {
    //final viewInsets = View.of(context).viewInsets;
    //return viewInsets.bottom == 0;
 // }

 // static bool isPortraitOrientation(BuildContext context) {
   // final viewInsets = View.of(context).viewInsets;
   // return viewInsets.bottom != 0;
  //}

  static void setFullScreen(bool enable) {
      SystemChrome.setEnabledSystemUIMode(enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  static double getScreenHeight() {
      return MediaQuery.of(Get.context!).size.height;
  }

   static double getScreenWidth(BuildContext context) {
      return MediaQuery.of(context).size.height;
  }

  static double getPixelRatio() {
      return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  static double getStatusbarHeight() {
      return MediaQuery.of(Get.context!).padding.top;
  }

  static double getBottomNavigationBarHeight() {
    return 50;
  }

  static double getAppBarHeight() {
     return 80;
  }

  static  Future<bool> hasInternetConnection() async {
    try{
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static bool isIOS() { 
      return Platform.isIOS;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }


   static  Future<void> launchUrl(String url) async {
    if(await canLaunchUrlString(url)) {
       await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
     }
   }
}
