import 'package:charity_circle/components/elevated_button_custom.dart';
import 'package:charity_circle/components/text_form_field_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const String routeName = "forget-password-screen";
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _forgotPasswordFormKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(
              maxWidth: 600,
            ),
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.handHoldingHeart,
                    size: 50,
                  ),
                  Text(
                    "Forgot Password",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Form(
                    key: _forgotPasswordFormKey,
                    child: Column(
                      spacing: 15,
                      children: [
                        TextFormFieldCustom(
                          controller: _emailController,
                          icon: Icon(CupertinoIcons.envelope),
                          hintText: "Email",
                          isEmail: true,
                        ),
                        ElevatedButtonCustom(
                          onPressed: () {
                            //TODO
                            if (_forgotPasswordFormKey.currentState!
                                .validate()) {}
                          },
                          text: "Send Mail",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
