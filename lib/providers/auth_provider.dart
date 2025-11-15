import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  // دالة لإنشاء حساب جديد (حفظ وهمي)
  Future<bool> register(String username, String email, String mobile, String password) async {
    final prefs = await SharedPreferences.getInstance();
    
    // سنقوم بحفظ بيانات مستخدم واحد فقط للتبسيط
    await prefs.setString('email', email);
    await prefs.setString('password', password); // ملاحظة: لا تحفظ كلمات المرور هكذا في تطبيق حقيقي!
    await prefs.setString('username', username);

    print("User registered: $email");
    return true;
  }

  // دالة تسجيل الدخول
  Future<bool> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();

    final storedEmail = prefs.getString('email');
    final storedPassword = prefs.getString('password');

    if (email == storedEmail && password == storedPassword) {
      _isLoggedIn = true;
      notifyListeners(); // إخبار المستمعين (التطبيق) أن الحالة تغيرت
      print("Login successful");
      return true;
    }
    
    print("Login failed");
    return false;
  }

  // دالة تسجيل الخروج
  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}