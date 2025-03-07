import 'package:flutter/material.dart';
import 'package:voltsense2/utils/constants/colors.dart';

class profinfo extends StatelessWidget {
  const profinfo(
      {super.key,
      required this.preicon,
      required this.onPressed,
      required this.title,
      required this.value,
      this.icon = Icons.arrow_forward});

  final String title, value;
  final VoidCallback onPressed;
  final IconData icon;
  final IconData preicon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              preicon,
              size: 18,
              color: VColors.primaryColor,
            ),
          ),
          Expanded(
              flex: 2,
              child: Text(title,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis)),
          Expanded(
              flex: 5,
              child: Text(value,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis)),
          GestureDetector(
              onTap: onPressed,
              child: Icon(
                icon,
                size: 20,
                color: VColors.buttonPrimary,
              )),
        ],
      ),
    );
  }
}
