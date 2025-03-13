import 'package:flutter/material.dart ';
import 'package:voltsense2/common/styles/spacing_styles.dart';
//import 'package:voltsense2/features/authentication/screens/login/login.dart';
import 'package:voltsense2/utils/constants/sizes.dart';
//import 'package:voltsense2/utils/helpers/helper_functions.dart';

class SucessScreen extends StatelessWidget {
  const SucessScreen(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onPressed});

  final VoidCallback onPressed;
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: VSpacingStyle.paddingWithhAppBarHeight * 2,
      child: Column(
        children: [
          //Image

          //Texts
          Text(title,
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center),
          const SizedBox(height: VSizes.spaceBtwItems),
          Text(subtitle,
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center),
          const SizedBox(height: VSizes.spaceBtwItems),
          /*Text('lahfdsa',
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center),
          const SizedBox(height: VSizes.spaceBtwSections),*/

          //Buttons
          SizedBox(
            width: double.infinity,
            child:
                ElevatedButton(onPressed: onPressed, child: Text("Continue")),
          )
        ],
      ),
    )));
  }
}
