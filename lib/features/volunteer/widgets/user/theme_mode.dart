import 'package:charity_circle/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeModeLightandDark extends StatefulWidget {
  const ThemeModeLightandDark({super.key});

  @override
  State<ThemeModeLightandDark> createState() => _ThemeModeLightandDarkState();
}

class _ThemeModeLightandDarkState extends State<ThemeModeLightandDark> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(
      builder: (context, value, child) {
        return ListTile(
          title: Text("App theme"),
          trailing: IconButton(
            onPressed: () async {
              await value.toggleMode();
            },
            icon: value.isDarkMode
                ? Icon(
                    Icons.light_mode,
                    color: Colors.yellow,
                  )
                : Icon(
                    Icons.dark_mode,
                  ),
          ),
        );
      },
    );
  }
}
