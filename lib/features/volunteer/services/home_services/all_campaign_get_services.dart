
import 'package:charity_circle/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllCampaignGetServices {
  //Instances
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //fetch data
  Stream<QuerySnapshot<Map<String, dynamic>>> fetchAllCampaign({
    required BuildContext context,
  }) {
    try {
      Stream<QuerySnapshot<Map<String, dynamic>>> querySnapshot =
          _firebaseFirestore.collection("All-Campaign").snapshots();

      return querySnapshot;
    } catch (e) {
      Utils.showSnackBar(
        context: context,
        content: e.toString(),
      );
      return Stream.empty();
    }
  }
}
