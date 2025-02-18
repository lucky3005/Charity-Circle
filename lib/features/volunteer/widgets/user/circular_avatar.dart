import 'package:charity_circle/core/colors.dart';
import 'package:charity_circle/core/images.dart';
import 'package:flutter/material.dart';

class CustomCircularAvatar extends StatelessWidget {
  final String imageUrl;
  const CustomCircularAvatar({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CircleAvatar(
        backgroundColor: AppColors.splashBackground,
        radius: 60,
        child: Image.asset(
          imageUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
