//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:voltsense2/data/repositories.authentication/authentication_repository.dart';
import 'package:voltsense2/utils/constants/image_strings.dart';
import 'package:voltsense2/utils/constants/loaders.dart';
import 'package:voltsense2/utils/logging/network_manager.dart';
import 'package:voltsense2/utils/popups/full_sccreen_loader.dart';

class LoginController extends GetxController {
  /// variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final localStorage = GetStorage();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  ///Email and password
  Future<void> emailAndPasswordSignIn() async {
    try {
      //Start Loading
      VFullScreenLoader.openLoadingDialog(
          'Loggin you in', VImages.docerAnimation);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        VFullScreenLoader.stopLoadingDialog();
        VLoaders.errorSnackBar(
            title: 'No Internet',
            message: 'Please check your internet connection.');
        return;
      }
      //form validation
      //if (!loginFormKey.currentState!.validate()) {
      //  VFullScreenLoader.stopLoadingDialog();
      //  return;
      //}

      //Save Data if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      //Login user using EMail & Password Authentication
      try {
        final userCredentials = await AuthenticationRepository.instance
            .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
        print("User logged in successfully: ${userCredentials.user?.email}");

        // Remove loader
        VFullScreenLoader.stopLoadingDialog();

        // Redirect to another screen on successful login
        AuthenticationRepository.instance.screenRedirect();
      } on FirebaseAuthException catch (e) {
        VFullScreenLoader.stopLoadingDialog();
        VLoaders.errorSnackBar(title: 'Login Failed', message: e.toString());
      }

      //Remove Loader
      VFullScreenLoader.stopLoadingDialog();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      VFullScreenLoader.stopLoadingDialog();
      VLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
