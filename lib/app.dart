import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:voltsense2/bindings/bindings.dart';
//import 'package:voltsense2/features/authentication/screens/login/login.dart';
import 'package:voltsense2/utils/constants/colors.dart';
import 'package:voltsense2/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: VAppTheme.lightTheme,
        darkTheme: VAppTheme.darkTheme,
        initialBinding: GeneralBindings(),
        home: const Scaffold(
            backgroundColor: VColors.primaryColor,
            body:
                Center(child: CircularProgressIndicator(color: Colors.white))));
  }
}
