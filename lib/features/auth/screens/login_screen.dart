import 'package:charity_circle/components/circular_indicator.dart';
import 'package:charity_circle/components/elevated_button_custom.dart';
import 'package:charity_circle/components/text_form_field_custom.dart';
import 'package:charity_circle/core/colors.dart';
import 'package:charity_circle/features/auth/screens/forget_password_screen.dart';
import 'package:charity_circle/features/auth/screens/signup_screen.dart';
import 'package:charity_circle/features/auth/services/auth_services.dart';
import 'package:charity_circle/features/volunteer/widgets/bottom_nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool isLoading = false;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    setState(() {
      isLoading = true;
    });

    AuthServices authServices = AuthServices();
    User? user = await authServices.signIn(
      context: context,
      email: email,
      password: password,
    );
    setState(() {
      isLoading = false;
    });
    if (user!.email == email) {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      
    }
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
                          "Welcome Back!",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Form(
                          key: _loginFormKey,
                          child: Column(
                            spacing: 15,
                            children: [
                              TextFormFieldCustom(
                                controller: _emailController,
                                icon: Icon(CupertinoIcons.envelope),
                                hintText: "Email",
                                isEmail: true,
                              ),
                              TextFormFieldCustom(
                                controller: _passwordController,
                                icon: Icon(CupertinoIcons.lock),
                                hintText: "Password",
                                isPassword: true,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      ForgetPasswordScreen.routeName,
                                    );
                                  },
                                  child: Text("Forgot Password?"),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              ElevatedButtonCustom(
                                onPressed: () {
                                  if (_loginFormKey.currentState!.validate()) {
                                    login(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text.trim(),
                                    );
                                  }
                                },
                                text: "Login",
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don't have an account "),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, SignupScreen.routeName);
                                      },
                                      child: Text(
                                        "SignUp",
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
