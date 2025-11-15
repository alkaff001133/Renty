import 'package:flutter/material.dart';

class AppTheme {
  // اللون الأزرق/السماوي الأساسي من تصميم Renty
  static const Color primaryColor = Color(0xFF00BFFF);
  static const Color backgroundColor = Colors.black;
  static const Color textFieldFillColor = Color(0xFFF3F3F3); // لون حقل الإدخال

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    
    // تصميم موحد للأزرار
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.black, // لون النص داخل الزر
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    ),

    // تصميم موحد لحقول الإدخال
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: textFieldFillColor,
      hintStyle: const TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none, // بدون حدود
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: primaryColor, width: 2),
      ),
    ),
    
    // تصميم النصوص
    textTheme: const TextTheme(
      headlineMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(color: Colors.white70),
    ),
  );
}