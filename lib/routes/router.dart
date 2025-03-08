import 'package:charity_circle/features/auth/screens/forget_password_screen.dart';
import 'package:charity_circle/features/auth/screens/login_screen.dart';
import 'package:charity_circle/features/auth/screens/signup_screen.dart';
import 'package:charity_circle/features/charity/screen/all_campaign.dart';
import 'package:charity_circle/features/charity/screen/home_screen.dart';
import 'package:charity_circle/features/charity/widgets/bottom_nav_bar.dart';
import 'package:charity_circle/features/intro/splash_screen.dart';
import 'package:charity_circle/features/volunteer/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    //SplashScreen
    case SplashScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const SplashScreen(),
      );

    //Login Screen
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      );

    //Signup Screen
    case SignupScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const SignupScreen(),
      );

    //Forget Password Screen
    case ForgetPasswordScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const ForgetPasswordScreen(),
      );

    //Bottom Nav Bar Screen for Volunteer
    case BottomNavBar.routeName:
      return MaterialPageRoute(
        builder: (_) => const BottomNavBar(),
      );

    //Nav Bar Screen for Charity
    case BottomNavBarCharity.routeName:
      return MaterialPageRoute(
        builder: (_) => const BottomNavBarCharity(),
      );

    //Add All Campaign Charity
    case AllCampaign.routeName:
      return MaterialPageRoute(
        builder: (_) => const AllCampaign(),
      );

    // 404
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
