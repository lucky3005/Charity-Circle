import 'package:charity_circle/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:badges/badges.dart' as badges;

class UpperText extends StatelessWidget {
  const UpperText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome,",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              "Lucky Singh",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.chocolate,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: badges.Badge(
            position: badges.BadgePosition.topEnd(top: -18, end: -10),
            badgeStyle: badges.BadgeStyle(
              badgeColor: AppColors.splashBackground,
            ),
            badgeContent: Text(
              '1',
            ),
            child: Icon(
              FontAwesomeIcons.bell,
            ),
          ),
        ),
      ],
    );
  }
}
