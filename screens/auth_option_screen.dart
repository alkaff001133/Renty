import 'package:flutter/material.dart';
import 'login_screen.dart'; // سننتقل إليها
import 'register_screen.dart'; // سننتقل إليها


class AuthOptionScreen extends StatelessWidget {
  const AuthOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // "Stack" لوضع "طبقات" فوق بعضها
      body: Stack(
        fit: StackFit.expand, // اجعل "الكومة" تملأ الشاشة
        children: [
          // --- الطبقة الأولى (الخلفية): الصورة ---
          Image.asset(
            'assets/images/main_car.png', // !! استبدل هذا بمسار صورتك (سيارة الشارع) !!
            fit: BoxFit.cover,

            // "خدعة" لجعل الصورة أغمق قليلاً ليظهر المحتوى
            color: Colors.black.withOpacity(0.4),
            colorBlendMode: BlendMode.darken,
          ),

          // --- الطبقة الثانية (الأمامية): المحتوى ---
          // نضع "عمود" (Column) ليحتوي الأزرار
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end, // اجعل كل شيء في الأسفل
              children: [
                // --- 1. زر تسجيل الدخول (Login) ---
                ElevatedButton(
                  // سيأخذ التصميم الأزرق تلقائياً من "الثيم"
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    // "الربط"
                    // "push" -> "اذهب إلى" شاشة الدخول
                    // نستخدم "push" ليتمكن المستخدم من "الرجوع" لهذه الشاشة
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16), // مسافة

                // --- 2. كلمة "OR" ---
                const Text(
                  "OR",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 16), // مسافة

                // --- 3. زر إنشاء حساب (Register) ---
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    // "الربط"
                    // "push" -> "اذهب إلى" شاشة إنشاء الحساب
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 40), // مسافة أكبر

                // --- 4. أيقونات السوشيال ميديا ---
                // (يمكنك استبدال "Icon" بـ "Image.asset" لو عندك صور للأيقونات)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Google
                    _buildSocialIcon(Icons.g_mobiledata), // مثال
                    const SizedBox(width: 30),
                    // Facebook
                    _buildSocialIcon(Icons.facebook), // مثال
                    const SizedBox(width: 30),
                    // Instagram
                    _buildSocialIcon(Icons.camera_alt_outlined), // مثال
                  ],
                ),
                const SizedBox(height: 60), // مسافة سفلية
              ],
            ),
          ),
        ],
      ),
    );
  }

  // دالة مساعدة لرسم أيقونات السوشيال ميديا
  Widget _buildSocialIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 1.5),
      ),
      child: Icon(icon, color: Colors.white, size: 30),
    );
  }
}

// ❌ تم حذف السطر "class StatelessWidget {}" الخاطئ من هنا