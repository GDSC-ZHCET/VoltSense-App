import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:voltsense2/data/repositories.authentication/authentication_repository.dart';
import 'firebase_options.dart';
//import 'package:voltsense2/utils/constants/colors.dart';
import 'app.dart';

//entry point of flutter app
Future<void> main() async {
  ///Widgets Binding
  final WidgetsBinding widgetBinding =
      WidgetsFlutterBinding.ensureInitialized();

  ///Local Storage
  await GetStorage.init();

  ///--Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);

  ///--Initialize Firebase and Authentication repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  ///await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  ///    .then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  try {
    await Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform)
        .then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  } catch (e) {
    debugPrint("Firebase Initialization Error: $e");
  }
  runApp(const MyApp());
}
