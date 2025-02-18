import 'dart:async';

import 'package:charity_circle/core/colors.dart';
import 'package:charity_circle/features/auth/screens/login_screen.dart';
import 'package:charity_circle/features/auth/services/auth_services.dart';
import 'package:charity_circle/features/charity/screen/home_screen.dart';
import 'package:charity_circle/features/volunteer/widgets/bottom_nav_bar.dart';
import 'package:charity_circle/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash-screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthServices authServices = AuthServices();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  String? userType;
  @override
  void initState() {
    Timer(
      Duration(seconds: 1),
      () => checkUser(),
    );
    super.initState();
  }

  Future<void> checkUser() async {
    try {
      User? user = await authServices.loggedIn();
      if (user == null) {
        Navigator.pushReplacementNamed(
          context,
          LoginScreen.routeName,
        );
        return;
      }

      DocumentSnapshot<Map<String, dynamic>> data =
          await firebaseFirestore.collection("Users").doc(user.uid).get();

      if (data['email'] == user.email) {
        if (data["type"] == "volunteer") {
          Navigator.pushNamedAndRemoveUntil(
            context,
            BottomNavBar.routeName,
            (route) => false,
          );
        }
        if (data["type"] == "charity") {
          Navigator.pushNamedAndRemoveUntil(
            context,
            CharityHomeScreen.routeName,
            (route) => false,
          );
        }
      }
    } catch (e) {
      Utils.showSnackBar(
        context: context,
        content: e.toString(),
        color: AppColors.warningColor,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: FaIcon(
              FontAwesomeIcons.handHoldingHeart,
              size: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Charity Circle",
                style: TextStyle(
                  fontSize: 22,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
