import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voltsense2/utils/constants/colors.dart';
import 'package:voltsense2/utils/helpers/helper_functions.dart';
import '../../common/widgets/loaders/animation_loader.dart';

// A utility class for managing a full-screen loading dialog
class VFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation
  /// This method doesn't return anything
  ///
  /// Parameters:
  ///   - text: the text to be displayed in the loading dialog
  ///   - animation: the lottie animation to be shown
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext ?? Get.context!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: VHelperFunctions.isDarkMode(Get.context!)
              ? VColors.dark
              : VColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              VAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  /// stop the currently open loading dialog
  /// this method doesn't return anything
  static void stopLoadingDialog() {
    Navigator.of(Get.overlayContext!)
        .pop(); // close the dialog using the navigator
  }
}
