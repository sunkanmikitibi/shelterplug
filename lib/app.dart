import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:realestateapi/bidings/general_bidings.dart';
import 'package:realestateapi/screen/onboarding_screens/onboarding.dart';
import 'package:realestateapi/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: SheltherTheme.lightTheme,
      initialBinding: GeneralBindings(),
      darkTheme: SheltherTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}
