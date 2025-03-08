import 'package:charity_circle/components/circular_indicator.dart';
import 'package:charity_circle/components/elevated_button_custom.dart';
import 'package:charity_circle/components/text_form_field_custom.dart';
import 'package:charity_circle/core/colors.dart';
import 'package:charity_circle/features/auth/services/auth_services.dart';
import 'package:charity_circle/features/charity/widgets/bottom_nav_bar.dart';
import 'package:charity_circle/features/volunteer/widgets/bottom_nav_bar.dart';
import 'package:charity_circle/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<String> items = ["volunteer", "charity"];

class SignupScreen extends StatefulWidget {
  static const String routeName = '/signup';
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _signupFormKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // Dropdown items
  String selectedValue = items.first; // Holds the selected valueset

  bool isLoading = false;

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required String type,
  }) async {
    setState(() {
      isLoading = true;
    });
    AuthServices authServices = AuthServices();
    User? user = await authServices.signUp(
      context: context,
      name: name,
      email: email,
      password: password,
      type: type,
    );

    if (user == null) {
      setState(() {
        isLoading = false;
      });
      return;
    }

    if (user.email == email) {
      type == "volunteer"
          ? Navigator.pushNamedAndRemoveUntil(
              context,
              BottomNavBar.routeName,
              (route) => false,
            )
          : Navigator.pushNamedAndRemoveUntil(
              context,
              BottomNavBarCharity.routeName,
              (route) => false,
            );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: isLoading
              ? CircularIndicator()
              : Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints(
                    maxWidth: 600,
                  ),
                  padding: const EdgeInsets.all(12.0),
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
                          "Namaste User!",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Form(
                          key: _signupFormKey,
                          child: Column(
                            spacing: 15,
                            children: [
                              TextFormFieldCustom(
                                controller: _nameController,
                                icon: Icon(CupertinoIcons.person),
                                hintText: "Name",
                              ),
                              TextFormFieldCustom(
                                controller: _emailController,
                                icon: Icon(CupertinoIcons.envelope),
                                hintText: "Email",
                              ),
                              TextFormFieldCustom(
                                controller: _passwordController,
                                icon: Icon(
                                  CupertinoIcons.lock,
                                ),
                                hintText: "Password",
                                isPassword: true,
                              ),
                              TextFormFieldCustom(
                                controller: _confirmPasswordController,
                                icon: Icon(
                                  CupertinoIcons.lock,
                                ),
                                hintText: "Confirm Password",
                                isPassword: true,
                              ),
                              DropdownButton(
                                value: selectedValue,
                                isExpanded: true,
                                items: items.map((item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value!;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              ElevatedButtonCustom(
                                onPressed: () {
                                  if (_signupFormKey.currentState!.validate()) {
                                    if (_passwordController.text.trim() ==
                                        _confirmPasswordController.text
                                            .trim()) {
                                      signUp(
                                        name: _nameController.text.trim(),
                                        email: _emailController.text.trim(),
                                        password:
                                            _passwordController.text.trim(),
                                        type: selectedValue,
                                      );
                                    } else {
                                      Utils.showSnackBar(
                                        context: context,
                                        content: "Password doesn't match",
                                      );
                                    }
                                  }
                                  //TODO
                                },
                                text: "SignUp",
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Already have an account "),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: AppColors.chocolate,
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
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
