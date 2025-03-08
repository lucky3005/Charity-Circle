import 'package:charity_circle/features/auth/services/auth_services.dart';
import 'package:charity_circle/models/all_campaign_model.dart';
import 'package:charity_circle/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AllCampaignAddServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final AuthServices _authServices = AuthServices();

  Future<void> addData({
    required BuildContext context,
    required String imageUrl,
    required String title,
    required String description,
    required double goal,
    required double raised,
  }) async {
    try {
      User? user = await _authServices.loggedIn();
      if (user == null) {
        Utils.showSnackBar(
          context: context,
          content: "You are unauthorised",
        );
        return;
      }
      AllCampaignModel data = AllCampaignModel(
        imageUrl: imageUrl,
        title: title,
        description: description,
        goal: goal,
        raised: raised,
      );
      await _firebaseFirestore
          .collection("All-Campaign")
          .add(data.toDoc())
          .then(
        (value) {
          Utils.showSnackBar(
            context: context,
            content: "Data Added",
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(
        context: context,
        content: e.message.toString(),
      );
    }
  }
}
