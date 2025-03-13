import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:voltsense2/common/widgets/success_screen/success_screen.dart';
import 'package:voltsense2/features/authentication/controllers/verification/verify_email_controller.dart';
import 'package:voltsense2/features/authentication/screens/login/login.dart';
//import 'package:get/get.dart';
//import 'package:voltsense2/features/authentication/screens/signup/signup.dart';
import 'package:voltsense2/utils/constants/sizes.dart';
import 'package:voltsense2/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () =>
              VHelperFunctions.navigateToScreen(context, const LoginScreen()),
          //onPressed: () => Get.back(),
          icon: const Icon(CupertinoIcons.clear),
        )
      ]),
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(VSizes.defaultSpace),
              child: Column(
                children: [
                  //Image

                  //Title
                  Text("Verify your email address!",
                      style: Theme.of(context).textTheme.headlineLarge,
                      textAlign: TextAlign.center),
                  const SizedBox(height: VSizes.spaceBtwItems),
                  Text(email ?? '',
                      style: Theme.of(context).textTheme.labelLarge,
                      textAlign: TextAlign.center),
                  const SizedBox(height: VSizes.spaceBtwItems),
                  Text('lahfdsa',
                      style: Theme.of(context).textTheme.labelMedium,
                      textAlign: TextAlign.center),
                  const SizedBox(height: VSizes.spaceBtwSections),

                  //Buttons
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () =>
                              controller.checkEmailVerificationStatus(),
                          child: Text("Continue"))),
                  const SizedBox(height: VSizes.spaceBtwItems),
                  SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () => controller.sendEmailVerification(),
                          child: Text("Resend Email"))),
                ],
              ))),
    );
  }
}
