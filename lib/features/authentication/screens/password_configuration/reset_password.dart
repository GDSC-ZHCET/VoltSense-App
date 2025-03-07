import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voltsense2/features/authentication/screens/login/login.dart';
import 'package:voltsense2/utils/constants/sizes.dart';
import 'package:voltsense2/utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () =>
                  VHelperFunctions.navigateToScreen(context, LoginScreen()),
              icon: const Icon(CupertinoIcons.clear),
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(VSizes.defaultSpace),
                child: Column(
                  children: [
                    //Image
                    //Title & Subtitle
                    Text("Change your Password",
                        style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: VSizes.spaceBtwItems),
                    Text("change your password",
                        style: Theme.of(context).textTheme.labelMedium),
                    const SizedBox(height: VSizes.spaceBtwSections),

                    //Buttons
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => VHelperFunctions.navigateToScreen(
                              context, ResetPassword()),
                          child: Text("Done")),
                    ),
                    const SizedBox(height: VSizes.spaceBtwItems),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () => VHelperFunctions.navigateToScreen(
                              context, ResetPassword()),
                          child: Text("Resend Email")),
                    ),
                  ],
                ))));
  }
}
