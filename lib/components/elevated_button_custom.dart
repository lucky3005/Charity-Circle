import 'package:charity_circle/core/colors.dart';
import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const ElevatedButtonCustom({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,

      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.chocolate),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
