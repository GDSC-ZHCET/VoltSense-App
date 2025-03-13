import 'dart:math';

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voltsense2/data/repositories.authentication/authentication_repository.dart';
import 'package:voltsense2/data/repositories.authentication/user/user_repository.dart';
import 'package:voltsense2/features/authentication/screens/signup/verify_email.dart';
import 'package:voltsense2/features/personalization/models/user_model.dart';
import 'package:voltsense2/utils/constants/image_strings.dart';
import 'package:voltsense2/utils/constants/loaders.dart';
import 'package:voltsense2/utils/logging/network_manager.dart';
import 'package:voltsense2/utils/popups/full_sccreen_loader.dart';
//import 'package:voltsense2/lib/data/repositories.authentication/authentication_repository.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///variables
  final hidePassword = true.obs; // obervable for hiding/showing password
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for lastname input
  final username = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final firstName = TextEditingController(); // Controller for firstname input
  final phoneNumber =
      TextEditingController(); // Controller for phone number input
  GlobalKey<FormState> signupformKey = GlobalKey<
      FormState>(); //// GlobalKey used to control and validate form state

  ///--SIGNUP
  Future<void> signUp() async {
    try {
      // Start Loading
      VFullScreenLoader.openLoadingDialog(
          'We are proceeding your information...', VImages.animationLogo);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        print("cheching isconnected");
        VFullScreenLoader.stopLoadingDialog();
        return;
      }
      // Form Validation
      //if (!signupformKey.currentState!.validate()) {
      //  print("cheching formvalidation");
      //  //VFullScreenLoader.stopLoadingDialog();
      //  return;
      //}
      // Privacy Policy Check

      // Register user in the Firebase Authentication & Dave user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //Save Authentication user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //remove loader
      VFullScreenLoader.stopLoadingDialog();

      //show success message
      VLoaders.successSnackBar(
          title: 'Congratulations!',
          message: 'Your account has been created! Verify email to continue.');

      //move to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      print("error: $e");
      VFullScreenLoader.stopLoadingDialog();
    }

    //show some generic error to the user
    VLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  }
}
