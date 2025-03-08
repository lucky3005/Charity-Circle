import 'package:charity_circle/components/elevated_button_custom.dart';
import 'package:charity_circle/core/constants.dart';
import 'package:charity_circle/core/images.dart';
import 'package:charity_circle/features/auth/services/auth_services.dart';
import 'package:charity_circle/features/volunteer/widgets/user/circular_avatar.dart';
import 'package:charity_circle/features/volunteer/widgets/user/theme_mode.dart';
import 'package:charity_circle/features/volunteer/widgets/user/user_data.dart';
import 'package:charity_circle/utils/utils.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  AuthServices authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              CustomCircularAvatar(
                imageUrl: AppImages.manProfile,
              ),
              UserData(),
              ThemeModeLightandDark(),
              ElevatedButtonCustom(
                onPressed: () {
                  Utils.alertDialogue(
                      context: context,
                      title: "Alert!",
                      content: "Do you want to Log-Out?",
                      onPressed: () {
                        authServices.logOut(context: context);
                      });
                },
                text: "Sign-Out",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
