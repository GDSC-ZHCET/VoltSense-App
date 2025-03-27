/*import 'dart:math';
import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

class ToggleBar extends StatefulWidget {
  const ToggleBar({super.key});

  @override
  State<ToggleBar> createState() => _ToggleBarState();
}

class _ToggleBarState extends State<ToggleBar> with SingleTickerProviderStateMixin {
  bool initialValue = false;
  bool secondValue = false;
  bool thirdValue = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AnimatedToggleSwitch<bool>.size(
            current: initialValue,
            values: const [false, true],
            onChanged: (value) => setState(() => initialValue = value),
            iconBuilder: (value) => value
                ? const Icon(Icons.check, color: Colors.green)
                : const Icon(Icons.close, color: Colors.red),
          ),
          const SizedBox(height: 50),
          AnimatedToggleSwitch.dual(
            current: secondValue,
            first: false,
            second: true,
            onChanged: (value) => setState(() => secondValue = value),
            iconBuilder: (value) => value
                ? const Icon(Icons.toggle_on, color: Colors.blue)
                : const Icon(Icons.toggle_off, color: Colors.grey),
          ),
          const SizedBox(height: 50),
          AnimatedToggleSwitch.dual(
            current: thirdValue,
            first: false,
            second: true,
            spacing: 45,
            animationDuration: const Duration(milliseconds: 600),
            style: const ToggleStyle(
              borderColor: Colors.transparent,
              indicatorColor: Colors.white,
              backgroundColor: Colors.black,
            ),
            customStyleBuilder: (context, local, global) {
              if (global.position <= 0) {
                return ToggleStyle(backgroundColor: Colors.red[800]);
              }
              return ToggleStyle(
                backgroundGradient: LinearGradient(
                  colors: const [Colors.green, Colors.red],
                  stops: [
                    global.position - (1 - 2 * max(0, global.position - 0.5)) * 0.7,
                    global.position + max(0, 2 * (global.position - 0.5)) * 0.7,
                  ],
                ),
              );
            },
            borderWidth: 6,
            height: 60,
            onChanged: (value) => setState(() => thirdValue = value),
            iconBuilder: (value) => value
                ? const Icon(Icons.power_outlined, color: Colors.green, size: 32)
                : const Icon(Icons.power_settings_new_rounded, color: Colors.red, size: 32),
            textBuilder: (value) => value
                ? const Center(child: Text('Active'))
                : const Center(child: Text('Inactive')),
          ),
        ],
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:voltsense2/utils/constants/colors.dart';
import 'package:voltsense2/utils/helpers/helper_functions.dart';

class ToggleBar extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const ToggleBar({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  _ToggleBarState createState() => _ToggleBarState();
}

class _ToggleBarState extends State<ToggleBar> {
  late bool _isOn;

  @override
  void initState() {
    super.initState();
    _isOn = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 1.0,
          child: Switch(
            value: _isOn,
            onChanged: (value) {
              //setState(() {
              //  _isOn = value;
              //}
              //);
              //widget.onChanged(value);
            },
            activeColor: dark ? Colors.black : VColors.black,
            activeTrackColor: VColors.textWhite,
            inactiveThumbColor: Colors.black,
            inactiveTrackColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
