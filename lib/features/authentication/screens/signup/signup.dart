import 'package:flutter/material.dart';
import 'package:voltsense2/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:voltsense2/utils/constants/colors.dart';
import 'package:voltsense2/utils/constants/sizes.dart';
import 'package:voltsense2/utils/helpers/helper_functions.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(VSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //title
                    Text("Let's create your account",
                        style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(
                      height: VSizes.spaceBtwSections,
                    ),

                    //Form
                    VSignUpForm(),

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
                    SizedBox(height: VSizes.spaceBtwSections),

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
