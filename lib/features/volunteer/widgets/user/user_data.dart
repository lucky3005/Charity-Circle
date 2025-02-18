import 'package:charity_circle/components/list_tile.dart';
import 'package:charity_circle/core/constants.dart';
import 'package:charity_circle/features/auth/services/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserData extends StatefulWidget {
  const UserData({
    super.key,
  });

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  AuthServices authServices = AuthServices();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  void initState() {
    if (Constants.name == "") {
      getUserData();
    }
    super.initState();
  }

  Future<void> getUserData() async {
    User? user = await authServices.loggedIn();
    if (user == null) {
      return;
    }
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await firebaseFirestore.collection("Users").doc(user.uid).get();

    if (!snapshot.exists) {
      return;
    }
    Constants.name = snapshot["name"];
    Constants.email = snapshot["email"];
    Constants.type = snapshot["type"];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTile(
          icon: CupertinoIcons.person,
          title: Constants.name,
        ),
        CustomListTile(
          icon: CupertinoIcons.envelope,
          title: Constants.email,
        ),
        CustomListTile(
          icon: CupertinoIcons.phone,
          title: "123456789",
          //TODO
        ),
        CustomListTile(
          icon: Constants.type == "volunteer"
              ? FontAwesomeIcons.handHoldingHeart
              : Constants.type == "charity"
                  ? FontAwesomeIcons.peopleGroup
                  // ignore: deprecated_member_use
                  : FontAwesomeIcons.search,
          title: Constants.type,
        ),
      ],
    );
  }
}
