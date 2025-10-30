import 'package:flutter/material.dart';
import 'screens/profile_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(ProfileCardApp());
}

class ProfileCardApp extends StatefulWidget {
  @override
  State<ProfileCardApp> createState() => _ProfileCardAppState();
}

class _ProfileCardAppState extends State<ProfileCardApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _setThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Card App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode, // <- GUNAKAN MODE YANG DIPILIH
      home: ProfilePage(
        themeMode: _themeMode,
        onThemeChanged: _setThemeMode,
      ),
    );
  }
}
