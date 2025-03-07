import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:voltsense2/common/widgets/success_screen/success_screen.dart';
import 'package:voltsense2/features/authentication/screens/login/login.dart';
//import 'package:get/get.dart';
//import 'package:voltsense2/features/authentication/screens/signup/signup.dart';
import 'package:voltsense2/utils/constants/sizes.dart';
import 'package:voltsense2/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Text('ziyaali0072@gmail.com',
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
                          onPressed: () => VHelperFunctions.navigateToScreen(
                              context,
                              SucessScreen(
                                onPressed: () =>
                                    VHelperFunctions.navigateToScreen(
                                        context, const LoginScreen()),
                                //Get.to(() => const LoginScreen())
                              )),
                          child: Text("Continue"))),
                  const SizedBox(height: VSizes.spaceBtwItems),
                  SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () {}, child: Text("Resend Email"))),
                ],
              ))),
    );
  }
}
