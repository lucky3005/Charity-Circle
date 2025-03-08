import 'package:charity_circle/core/colors.dart';
import 'package:charity_circle/models/auth_model.dart';
import 'package:charity_circle/features/auth/screens/login_screen.dart';
import 'package:charity_circle/provider/user_provider.dart';
import 'package:charity_circle/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthServices {
  //Instances
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //Signup
  Future<User?> signUp({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required String type,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user == null) return null;

      AuthModel authModel =
          AuthModel(name: name, email: email, type: type, uid: user.uid);

      try {
        await _firebaseFirestore.collection("Users").doc(user.uid).set(
              authModel.toMap(),
            );

        Utils.showSnackBar(
          context: context,
          content: "User Created Successfully!",
          color: AppColors.successColor,
        );

        return user;
      } catch (firestoreError) {
        Utils.showSnackBar(
            context: context,
            content: "Failed to store user data: ${firestoreError.toString()}",
            color: AppColors.warningColor);
        return null;
      }
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(
        context: context,
        content: e.message ?? "Authentication failed",
        color: AppColors.warningColor,
      );
    } catch (e) {
      Utils.showSnackBar(
        context: context,
        content: "An unexpected error occurred: ${e.toString()}",
        color: AppColors.warningColor,
      );
    }
    return null;
  }

  //Login
  Future<User?> signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user == null) return null;

      return user;
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(
        context: context,
        content: e.message.toString(),
        color: AppColors.warningColor,
      );
    } catch (e) {
      Utils.showSnackBar(
        context: context,
        content: e.toString(),
        color: AppColors.warningColor,
      );
    }
    return null;
  }

  //Stay login
  Future<User?> loggedIn() async {
    User? user = await _firebaseAuth.currentUser;
    return user;
  }

  //Log-Out
  Future<void> logOut({
    required BuildContext context,
  }) async {
    await _firebaseAuth.signOut();
    Navigator.pushNamedAndRemoveUntil(
      context,
      LoginScreen.routeName,
      (route) => false,
    );
  }
}
