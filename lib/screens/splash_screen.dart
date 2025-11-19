import 'dart:async';
import 'package:final_project/screens/auth_option_screen.dart';
import 'package:final_project/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }


  void _navigate() async {

    await Future.delayed(const Duration(seconds: 3));

    final prefs = await SharedPreferences.getInstance();

    final bool onboardingComplete = prefs.getBool('onboardingComplete') ?? false;


    if (mounted) {
      if (onboardingComplete) {

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AuthOptionScreen()),
        );
      } else {

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppTheme.backgroundColor,
      body: Center(

        child: Image.asset(

          'assets/images/logo.png',

          width: 180,
        ),
      ),
    );
  }
}