import 'package:flutter/material.dart';
import 'package:voltsense2/utils/theme/custom_themes/bottom-sheet_theme.dart';
import 'package:voltsense2/utils/theme/custom_themes/checkbox_sheet_theme.dart';
import 'package:voltsense2/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:voltsense2/utils/theme/custom_themes/text_theme.dart';
import 'package:voltsense2/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:voltsense2/utils/theme/custom_themes/appbar_theme.dart';
import 'package:voltsense2/utils/theme/custom_themes/text_field_theme.dart';

class VAppTheme {
  VAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: VTextTheme.lightTextTheme,
    appBarTheme: VAppBarTheme.lightAppBarTheme,
    checkboxTheme: VCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: VBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: VOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: VTextFontFieldTheme.lightInputDecorationTheme,
    elevatedButtonTheme: VElevatedButtonTheme.lightElevatedButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: VTextTheme.darkTextTheme,
    appBarTheme: VAppBarTheme.darkAppBarTheme,
    checkboxTheme: VCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: VBottomSheetTheme.darkBottomSheetTheme,
    outlinedButtonTheme: VOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: VTextFontFieldTheme.darkInputDecorationTheme,
    elevatedButtonTheme: VElevatedButtonTheme.darkElevatedButtonTheme,
  );
}
