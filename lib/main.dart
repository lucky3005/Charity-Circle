import 'package:charity_circle/core/theme.dart';
import 'package:charity_circle/features/intro/splash_screen.dart';
import 'package:charity_circle/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:charity_circle/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Load saved theme preference
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool val = pref.getBool("theme_mode") ?? false;

  // Initialize AppTheme with saved preference
  final appTheme = AppTheme();
  await appTheme.loadThemeMode(val);

  // Lock orientation to portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(CharityCircle(appTheme: appTheme));
  });
}

class CharityCircle extends StatelessWidget {
  final AppTheme appTheme;

  const CharityCircle({super.key, required this.appTheme});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: appTheme, // Use the pre-initialized theme instance
        ),
      ],
      child: Consumer<AppTheme>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Charity Circle',
            theme: themeProvider.themeData, // Apply the correct theme
            initialRoute: SplashScreen.routeName,
            onGenerateRoute: (settings) => onGenerateRoute(settings),
          );
        },
      ),
    );
  }
}
