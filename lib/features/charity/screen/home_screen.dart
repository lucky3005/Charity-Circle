import 'package:charity_circle/features/volunteer/screens/user_screen.dart';
import 'package:flutter/material.dart';

class CharityHomeScreen extends StatefulWidget {
  static const String routeName = "/charity-home-screen";
  const CharityHomeScreen({super.key});

  @override
  State<CharityHomeScreen> createState() => _CharityHomeScreenState();
}

class _CharityHomeScreenState extends State<CharityHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Charity"),
      ),
      drawer: Drawer(
        child: UserScreen(),
      ),
    );
  }
}
