import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:realestateapi/app.dart';
import 'package:realestateapi/data/services/firebase_api.dart';
import 'firebase_options.dart';
import 'utils/repository/authentication_repository.dart';

//final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  //Add Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //Init Local Storage
  await GetStorage.init();
  //Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //initialize Firebase and Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(
      AuthenticationRepository(),
    ),
  );

  await FirebaseApi().initNotifications();

  runApp(
    const MyApp(),
  );
}
