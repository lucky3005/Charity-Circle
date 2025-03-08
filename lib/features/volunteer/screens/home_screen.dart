import 'package:charity_circle/features/volunteer/widgets/home/all_campaign.dart';
import 'package:charity_circle/features/volunteer/widgets/home/caraousel.dart';
import 'package:charity_circle/features/volunteer/widgets/home/categories.dart';
import 'package:charity_circle/features/volunteer/widgets/home/upper_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 30,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UpperText(),
                Caraousel(),
                Categories(),
                AllCampaign(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
