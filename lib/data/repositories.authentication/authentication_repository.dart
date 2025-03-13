//import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
//import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:voltsense2/features/authentication/screens/login/login.dart';
import 'package:voltsense2/features/authentication/screens/signup/verify_email.dart';
import 'package:voltsense2/features/nav_bar/screens/home/widgets/home.dart';
import 'package:voltsense2/navigation_menu.dart';
import 'package:voltsense2/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:voltsense2/utils/exceptions/firebase_exceptions.dart';
import 'package:voltsense2/utils/exceptions/format_exceptions.dart';
import 'package:voltsense2/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxService {
  static AuthenticationRepository get to => Get.find();
  static AuthenticationRepository instance = AuthenticationRepository();

  //variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //called from main.dart on app launch
  @override
  void onReady() {
    //Remove the native splash screen
    FlutterNativeSplash.remove();
    //Redirect to the appropriate screen
    screenRedirect();
  }

  //function to show relevant screen
  void screenRedirect() async {
    final User? user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      //Local storage
      deviceStorage.writeIfNull('isFirstTime', true);

      // If the user is opening the app for the first time
      if (deviceStorage.read('isFirstTime') != true) {
        // Set it to false, so next time onboarding is skipped
        deviceStorage.write('isFirstTime', false);

        // Redirect directly to LoginScreen (since onboarding is removed)
        Get.offAll(() => const LoginScreen());
      } else {
        // If not the first time, check if user is already logged in
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          // If user is logged in, redirect to HomeScreen
          Get.offAll(() => const HomeScreen());
        } else {
          // If user is not logged in, redirect to LoginScreen
          Get.offAll(() => const LoginScreen());
        }
      }
    }
  }

/*----------------Email & Password------------------*/

  ///[Email Authentication] - SignIn

  ///[Email Authentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      print("try block executing");
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw VFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw VFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const VFormatException();
    } on PlatformException catch (e) {
      throw VPlatformException(e.code).message;
    } catch (e) {
      print(e);
      throw 'Something went wrong, please try again';
    }
  }

  //[Email Verification] ---Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw VFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw VFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const VFormatException();
    } on PlatformException catch (e) {
      throw VPlatformException(e.code).message;
    } catch (e) {
      throw 'Something wet wrong. Please try again';
    }
  }

  ///[logout user] - valid for any authentication.
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw VFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw VFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const VFormatException();
    } on PlatformException catch (e) {
      throw VPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }
}
