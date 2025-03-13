import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get.dart';
import 'package:voltsense2/common/styles/spacing_styles.dart';
import 'package:voltsense2/features/authentication/controllers/login/login_controller.dart';
import 'package:voltsense2/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:voltsense2/features/authentication/screens/signup/signup.dart';
import 'package:voltsense2/navigation_menu.dart';
import 'package:voltsense2/utils/constants/colors.dart';
import 'package:voltsense2/utils/constants/image_strings.dart';
import 'package:voltsense2/utils/constants/sizes.dart';
import 'package:voltsense2/utils/helpers/helper_functions.dart';
//import 'package:voltsense2/lib/utils/theme/theme.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voltsense2/utils/validators/validation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final dark = VHelperFunctions.isDarkMode(context);
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: VSpacingStyle.paddingWithhAppBarHeight,
                child: Column(
                  children: [
                    //Logo, Title, Sub-Title
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          height: 150,
                          image: AssetImage(dark
                              ? VImages.darkAppLogo
                              : VImages.lightAppLogo),
                        ),
                        Text("WelCome Back!",
                            style: Theme.of(context).textTheme.headlineLarge),
                        const SizedBox(height: VSizes.sm),
                      ],
                    ),
                    //Form
                    Form(
                        key: controller.loginFormKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: VSizes.spaceBtwSections),
                          child: Column(
                            children: [
                              ///Email
                              TextFormField(
                                controller: controller.email,
                                validator: (value) =>
                                    VValidator.validateEmail(value),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Iconsax.direct_right),
                                  labelText: "E-Mail",
                                ),
                              ),
                              const SizedBox(
                                  height: VSizes.spaceBtwInputFields),

                              ///password
                              Obx(
                                () => TextFormField(
                                  controller: controller.password,
                                  validator: (value) =>
                                      VValidator.validatePassword(value),
                                  obscureText: controller.hidePassword.value,
                                  decoration: InputDecoration(
                                      labelText: "Password",
                                      prefixIcon: Icon(Iconsax.password_check),
                                      suffixIcon: IconButton(
                                        onPressed: () =>
                                            controller.hidePassword.value =
                                                !controller.hidePassword.value,
                                        icon: Icon(controller.hidePassword.value
                                            ? Iconsax.eye_slash
                                            : Iconsax.eye),
                                      )),
                                ),
                              ),

                              //Remember me & Forgot Password
                              Row(
                                children: [
                                  //Remember me
                                  Row(
                                    children: [
                                      Obx(() => Checkbox(
                                          value: controller.rememberMe.value,
                                          onChanged: (value) =>
                                              controller.rememberMe.value)),
                                      const Text("Remember me"),
                                    ],
                                  ),
                                  SizedBox(width: 90),

                                  //Forgot password
                                  TextButton(
                                      onPressed: () =>
                                          VHelperFunctions.navigateToScreen(
                                              context, ForgetPassword()),
                                      child: const Text("Forgot Password"))
                                ],
                              ),
                              const SizedBox(height: VSizes.spaceBtwSections),

                              //Sign In button
                              SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () =>
                                          VHelperFunctions.navigateToScreen(
                                              context, NavigationMenu()),
                                      child: Text("Sign In"))),
                              const SizedBox(height: VSizes.spaceBtwItems),
                              //Create Account Button
                              SizedBox(
                                  width: double.infinity,
                                  child: OutlinedButton(
                                      onPressed: () =>
                                          VHelperFunctions.navigateToScreen(
                                              context, const SignUpScreen()),
                                      child: Text("Create Account"))
                                  /*child: OutlinedButton(
                                  onPressed: () =>
                                      Get.to(() => const SignUpScreen()),
                                  child: Text("Create Account"))*/
                                  ),
                            ],
                          ),
                        )),
                    //Divider
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                            child: Divider(
                          color: dark ? VColors.darkGrey : VColors.grey,
                          thickness: 0.5,
                          indent: 60,
                          endIndent: 5,
                        )),
                        Text("or sign in with"),
                        Flexible(
                            child: Divider(
                          color: dark ? VColors.darkGrey : VColors.grey,
                          thickness: 0.5,
                          indent: 5,
                          endIndent: 60,
                        )),
                      ],
                    ),
                    //FOOTER
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: VColors.grey),
                              borderRadius: BorderRadius.circular(100)),
                          child: IconButton(
                              onPressed: () {},
                              //icon: const Image(
                              icon: Image.asset(
                                "assets/images/google.png",
                                width: VSizes.iconSm,
                                height: VSizes.iconSm,
                                //image: "assets/images/google.png",
                              )),
                        ),
                        const SizedBox(width: VSizes.spaceBtwItems)
                      ],
                    ),
                  ],
                ))));
  }
}
