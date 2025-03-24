import 'package:flutter/material.dart';

class VElevatedButtonTheme {
  VElevatedButtonTheme._();

  //light theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: Colors.black,
    disabledForegroundColor: Colors.grey,
    disabledBackgroundColor: Colors.black.withOpacity(0.5),
    side: const BorderSide(color: Colors.black),
    padding: const EdgeInsets.symmetric(vertical: 18),
    textStyle: const TextStyle(
        fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ));

  //dark theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.black,
    backgroundColor: Colors.white,
    disabledForegroundColor: Colors.grey,
    disabledBackgroundColor: Colors.white.withOpacity(0.5),
    side: const BorderSide(color: Colors.black),
    padding: const EdgeInsets.symmetric(vertical: 18),
    textStyle: const TextStyle(
        fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ));
}
