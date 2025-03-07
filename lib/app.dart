import 'package:flutter/material.dart';
import 'package:voltsense2/features/authentication/screens/login/login.dart';
import 'package:voltsense2/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: VAppTheme.lightTheme,
        darkTheme: VAppTheme.darkTheme,
        home: LoginScreen());
  }
}
