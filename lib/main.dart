import 'package:charity_circle/core/theme.dart';
import 'package:charity_circle/features/intro/splash_screen.dart';
import 'package:charity_circle/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:charity_circle/firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Lock to portrait mode
  ]).then((_) {
    runApp(const CharityCircle());
  });
}

class CharityCircle extends StatelessWidget {
  const CharityCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Charity Circle',
      theme: AppTheme.appTheme,
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: (settings) => onGenerateRoute(settings),
    );
  }
}
