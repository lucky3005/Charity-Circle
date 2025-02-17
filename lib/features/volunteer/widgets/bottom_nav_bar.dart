import 'package:charity_circle/core/colors.dart';
import 'package:charity_circle/features/volunteer/screens/chat_screen.dart';
import 'package:charity_circle/features/volunteer/screens/favorite_screen.dart';
import 'package:charity_circle/features/volunteer/screens/home_screen.dart';
import 'package:charity_circle/features/volunteer/screens/user_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  static const String routeName = "bottom-nav-bar";
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List selectedScreen = [
    HomeScreen(),
    FavoriteScreen(),
    ChatScreen(),
    UserScreen()
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
              NavigationDestination(
                icon: currentIndex != 2
                    ? Icon(CupertinoIcons.chat_bubble)
                    : Icon(CupertinoIcons.chat_bubble_text_fill),
                label: "Chat",
              ),
              NavigationDestination(
                icon: currentIndex != 3
                    ? Icon(CupertinoIcons.person)
                    : Icon(CupertinoIcons.person_solid),
                label: "User",
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
