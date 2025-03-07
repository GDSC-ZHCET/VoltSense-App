import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voltsense2/features/authentication/screens/signup/verify_email.dart';
import 'package:voltsense2/utils/constants/sizes.dart';
import 'package:voltsense2/utils/helpers/helper_functions.dart';

class VSignUpForm extends StatelessWidget {
  const VSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: "First Name", prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              SizedBox(width: VSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: "Last Name", prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          SizedBox(height: VSizes.spaceBtwInputFields),

          // Username
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: "Username", prefixIcon: Icon(Iconsax.user_edit)),
          ),
          SizedBox(height: VSizes.spaceBtwInputFields),
          //Email
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: "E-Mail", prefixIcon: Icon(Iconsax.direct)),
          ),
          SizedBox(height: VSizes.spaceBtwInputFields),
          //Phone Number
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: "Phone", prefixIcon: Icon(Iconsax.call)),
          ),
          SizedBox(height: VSizes.spaceBtwInputFields),

          //Password
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Password",
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          SizedBox(height: VSizes.spaceBtwInputFields),

          //Signup Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => VHelperFunctions.navigateToScreen(
                    context, const VerifyEmailScreen()),
                child: Text("Create Account")),
          ),
          SizedBox(height: VSizes.spaceBtwSections),
          //Divider
        ],
      ),
    );
  }
}
