import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voltsense2/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:voltsense2/utils/constants/sizes.dart';
import 'package:voltsense2/utils/helpers/helper_functions.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: EdgeInsets.all(VSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Heading
                Text("Forget Password?",
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: VSizes.spaceBtwItems),
                Text("Forget Password",
                    style: Theme.of(context).textTheme.labelMedium),
                const SizedBox(height: VSizes.spaceBtwSections * 2),

                //Text field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "email",
                    prefixIcon: Icon(Iconsax.direct_right),
                  ),
                ),
                const SizedBox(height: VSizes.spaceBtwSections),

                //Submit Button
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => VHelperFunctions.navigateToScreen(
                            context, ResetPassword()),
                        child: Text("Submit")))
              ],
            )));
  }
}
