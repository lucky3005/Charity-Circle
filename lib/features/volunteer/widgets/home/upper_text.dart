import 'package:charity_circle/core/colors.dart';
import 'package:charity_circle/core/constants.dart';
import 'package:charity_circle/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class UpperText extends StatelessWidget {
  const UpperText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
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
              Consumer<UserProvider>(
                builder: (context, provider, child) {
                  return Text(
                    provider.getUser.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.chocolate,
                    ),
                  );
                },
              )
            ],
          ),
          Consumer<Constants>(
            builder: (context, provider, child) {
              return badges.Badge(
                position: badges.BadgePosition.custom(top: -10, end: -1),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: AppColors.splashBackground,
                ),
                badgeContent: Text(
                  provider.allCampaignLength.toString(),
                ),
                child: IconButton(
                  onPressed: () {
                    //TODO
                  },
                  icon: Icon(
                    CupertinoIcons.bell,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
