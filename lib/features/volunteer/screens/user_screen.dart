import 'package:charity_circle/components/elevated_button_custom.dart';
import 'package:charity_circle/features/auth/screens/login_screen.dart';
import 'package:charity_circle/features/auth/services/auth_services.dart';
import 'package:charity_circle/features/volunteer/widgets/user/circular_avatar.dart';
import 'package:charity_circle/utils/utils.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomCircularAvatar(),
            ElevatedButtonCustom(
              onPressed: () {
                AuthServices authServices = AuthServices();
                Utils.alertDialogue(
                    context: context,
                    title: "Alert!",
                    content: "Do you want to Log-Out",
                    onPressed: () {
                      authServices.logOut().then(
                            (value) => Navigator.pushNamedAndRemoveUntil(
                              context,
                              LoginScreen.routeName,
                              (route) => false,
                            ),
                          );
                    });
              },
              text: "SignOut",
            ),
          ],
        ),
      ),
    );
  }
}
