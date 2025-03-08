import 'package:charity_circle/features/charity/screen/all_campaign.dart';
import 'package:charity_circle/features/volunteer/screens/user_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      drawer: Drawer(
        child: UserScreen(),
      ),
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Emergency Help",
        onPressed: () {
          Navigator.pushNamed(
            context,
            AllCampaign.routeName,
          );
        },
        child: Icon(
          Icons.campaign_sharp,
        ),
      ),
    );
  }
}
