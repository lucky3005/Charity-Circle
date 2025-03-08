import 'package:charity_circle/features/auth/screens/login_screen.dart';
import 'package:charity_circle/features/auth/services/auth_services.dart';
import 'package:charity_circle/features/charity/widgets/bottom_nav_bar.dart';
import 'package:charity_circle/features/volunteer/widgets/bottom_nav_bar.dart';
import 'package:charity_circle/provider/user_provider.dart';
import 'package:charity_circle/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserServices {
  //Instance
  final AuthServices _authServices = AuthServices();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //fetch user info
  Future<void> fetchUserData({
    required BuildContext context,
  }) async {
    try {
      User? user = await _authServices.loggedIn();
      if (user == null) {
        Navigator.pushReplacementNamed(
          context,
          LoginScreen.routeName,
        );
        return;
      }
      DocumentSnapshot<Map<String, dynamic>> data =
          await _firebaseFirestore.collection("Users").doc(user.uid).get();

      Provider.of<UserProvider>(context, listen: false).setUser(data);

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
            BottomNavBarCharity.routeName,
            (route) => false,
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(
        context: context,
        content: e.message.toString(),
      );
    }
  }
}
