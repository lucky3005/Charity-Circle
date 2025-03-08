import 'dart:async';

import 'package:charity_circle/core/colors.dart';
import 'package:charity_circle/features/auth/services/auth_services.dart';
import 'package:charity_circle/features/volunteer/services/user_services/user_services.dart';
import 'package:charity_circle/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      final UserServices userServices = UserServices();
      await userServices.fetchUserData(context: context);
    } catch (e) {
      print(e.toString());
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
