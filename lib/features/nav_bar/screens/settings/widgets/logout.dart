import 'package:flutter/material.dart';

Future<void> showLogOutDialog({
  required BuildContext context,
  required Function() onLogOut,
}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Center(child: Text('Log Out')),
        content: Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              onLogOut();
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      );
    },
  );
}
