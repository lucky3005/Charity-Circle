import 'package:charity_circle/core/colors.dart';
import 'package:charity_circle/core/images.dart';
import 'package:flutter/material.dart';

class CustomCircularAvatar extends StatelessWidget {
  const CustomCircularAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.splashBackground,
      radius: 60,
      child: Image.asset(
        AppImages.manProfile,
        fit: BoxFit.fill,
      ),
    );
  }
}
