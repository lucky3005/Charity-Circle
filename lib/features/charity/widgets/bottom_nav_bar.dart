import 'package:charity_circle/core/colors.dart';
import 'package:charity_circle/features/charity/screen/home_screen.dart';
import 'package:charity_circle/features/volunteer/screens/favorite_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBarCharity extends StatefulWidget {
  static const String routeName = "bottom-nav-bar-charity";
  const BottomNavBarCharity({super.key});

  @override
  State<BottomNavBarCharity> createState() => _BottomNavBarCharityState();
}

class _BottomNavBarCharityState extends State<BottomNavBarCharity> {
  List selectedScreen = [
    CharityHomeScreen(),
    FavoriteScreen(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    void currentPage(index) {
      setState(() {
        currentIndex = index;
      });
    }

    return Center(
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(
          maxWidth: 600,
        ),
        child: Scaffold(
          body: selectedScreen[currentIndex],
          bottomNavigationBar: NavigationBar(
            destinations: [
              NavigationDestination(
                icon: currentIndex != 0
                    ? Icon(CupertinoIcons.home)
                    : Icon(CupertinoIcons.house_fill),
                label: "Home",
              ),
              NavigationDestination(
                icon: currentIndex != 1
                    ? Icon(CupertinoIcons.heart)
                    : Icon(CupertinoIcons.heart_solid),
                label: "Favorite",
              ),
            ],
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            indicatorColor: AppColors.splashBackground,
            selectedIndex: currentIndex,
            onDestinationSelected: (value) => currentPage(value),
          ),
        ),
      ),
    );
  }
}
