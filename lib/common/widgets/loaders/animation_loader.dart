import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:voltsense2/utils/constants/colors.dart';
import 'package:voltsense2/utils/constants/sizes.dart';

/// A widget that displays a lottie animation with a text below it.
class VAnimationLoaderWidget extends StatelessWidget {
  /// Default constructor for the TAnimationLoaderWidget
  ///
  /// Parameters:
  ///   - text: the text to be displayed below the animation
  ///   - animation: the path to the lottie animation file
  ///   - showAction: whether to show an acttion button below the text
  ///   - actoinText: the text to be displayed on the action button
  ///   - onActionPressed: callback function to be executed when the action button is pressed.
  const VAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final void Function()? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8),
        const SizedBox(height: VSizes.defaultSpace),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: VSizes.defaultSpace),
        showAction
            ? SizedBox(
                width: 250,
                child: OutlinedButton(
                  style:
                      OutlinedButton.styleFrom(backgroundColor: VColors.dark),
                  onPressed: onActionPressed,
                  child: Text(actionText!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.apply(color: VColors.light)),
                ))
            : const SizedBox(),
      ],
    );
  }
}
