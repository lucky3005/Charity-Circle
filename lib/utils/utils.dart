import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar({
    required BuildContext context,
    required String content,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }

  static void alertDialogue(
      {required BuildContext context,
      required String title,
      required String content,
      required VoidCallback onPressed}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: onPressed,
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }
}
