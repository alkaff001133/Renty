import 'dart:async';
import 'package:final_project/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'welcome_screen.dart'; 
import 'auth_option_screen.dart';  


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

// ... (داخل ملف splash_screen.dart)
// ... (داخل كلاس _SplashScreenState)

  void _navigate() async {
    await Future.delayed(const Duration(seconds: 3)); // انتظار 3 ثوانٍ

    final prefs = await SharedPreferences.getInstance();
    // نقرأ "الختم" من "دفتر الملاحظات"
    final bool onboardingComplete = prefs.getBool('onboardingComplete') ?? false;

    if (mounted) {
      if (onboardingComplete) {
        // "لقد أكمل الجولة من قبل"
        // اذهب مباشرة إلى شاشة الاختيار
        Navigator.pushReplacement(
          context,
          // ❌ ليس LoginScreen
          MaterialPageRoute(builder: (context) => const AuthOptionScreen()), // ✅
        );
      } else {
        // "هذه هي المرة الأولى"
        // ابدأ الجولة من أول شاشة ترحيبية
        Navigator.pushReplacement(
          context,
          // ❌ ليس OnboardingScreen
          MaterialPageRoute(builder: (context) => const WelcomeScreen()), // ✅
        );
      }
    }
  }
// ... (باقي الملف)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Center(
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppTheme.primaryColor, width: 4),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.directions_car, color: AppTheme.primaryColor, size: 40),
              SizedBox(height: 8),
              Text(
                "Renty",
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}