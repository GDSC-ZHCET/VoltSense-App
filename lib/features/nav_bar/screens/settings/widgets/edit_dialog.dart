import 'package:flutter/material.dart';

Future<void> showEditDialog({
  required BuildContext context,
  required String fieldLabel,
  required String titleValue,
  required String currentValue,
  required Function(String) onSave,
}) async {
  final TextEditingController controller =
      TextEditingController(text: currentValue);

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(titleValue),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: ''),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              onSave(controller.text);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}
