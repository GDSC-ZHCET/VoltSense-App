import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
//import 'package:syncfusion_flutter_charts/charts.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:voltsense2/data/devices/device_controller/device_controller.dart';
import 'package:voltsense2/data/repositories.authentication/authentication_repository.dart';
import 'package:voltsense2/features/nav_bar/screens/graph/controller/graph_data_controller.dart';
//import 'package:voltsense2/features/nav_bar/screens/graph/controller/graph_data_controller.dart';
import 'package:voltsense2/features/personalization/controller/user_controller.dart';
import 'firebase_options.dart';
//import 'package:voltsense2/utils/constants/colors.dart';
import 'app.dart';

//------------------entry point of flutter app---------------------
Future<void> main() async {
  ///Widgets Binding
  final WidgetsBinding widgetBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //--------------Local Storage---------------------
  await GetStorage.init();

  //--------------Await Native Splash---------------
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);

  //----------Initialize Firebase and Authentication repository-----------------
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
  Get.put(DeviceController());
  Get.put(UserController());
  Get.put(GraphDataController());

  runApp(const MyApp());
}
