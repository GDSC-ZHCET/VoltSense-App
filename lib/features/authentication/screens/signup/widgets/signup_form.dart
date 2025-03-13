import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voltsense2/features/authentication/controllers/signup/signup_controller.dart';
//import 'package:voltsense2/features/authentication/screens/signup/verify_email.dart';
import 'package:voltsense2/utils/constants/sizes.dart';
//import 'package:voltsense2/utils/helpers/helper_functions.dart';
import 'package:voltsense2/utils/validators/validation.dart';

class VSignUpForm extends StatelessWidget {
  const VSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupformKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      VValidator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: "firstName", prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              SizedBox(width: VSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      VValidator.validateEmptyText('Last  name', value),
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
            controller: controller.username,
            validator: (value) =>
                VValidator.validateEmptyText('username', value),
            expands: false,
            decoration: const InputDecoration(
                labelText: "Username", prefixIcon: Icon(Iconsax.user_edit)),
          ),
          SizedBox(height: VSizes.spaceBtwInputFields),
          //Email
          TextFormField(
            controller: controller.email,
            validator: (value) => VValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
                labelText: "E-Mail", prefixIcon: Icon(Iconsax.direct)),
          ),
          SizedBox(height: VSizes.spaceBtwInputFields),
          //Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => VValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(
                labelText: "Phone", prefixIcon: Icon(Iconsax.call)),
          ),
          SizedBox(height: VSizes.spaceBtwInputFields),

          //Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => VValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  )),
            ),
          ),
          SizedBox(height: VSizes.spaceBtwInputFields),

          //Signup Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  if (controller.signupformKey.currentState!.validate()) {
                    // If form is valid, proceed with sign-up process
                    controller.signUp();
                  }
                },
                //onPressed: () => controller.signUp(),
                child: Text("Create Account")),
          ),
          SizedBox(height: VSizes.spaceBtwSections),
          //Divider
        ],
      ),
    );
  }
}
