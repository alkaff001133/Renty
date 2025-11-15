import 'package:flutter/material.dart';
import 'onboarding_screen.dart'; // سننتقل إليها
// لا نحتاج 'theme.dart' لأن الزر سيأخذ التصميم تلقائياً

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  // هذه هي الوظيفة التي سيتم استدعاؤها عند الضغط على "Let's Go!"
  void _getStarted(BuildContext context) async {
    if (context.mounted) {
      // "استبدل" الشاشة الحالية بالجزء التالي من الجولة
      Navigator.pushReplacement(
        context,
        // ❌ ليس LoginScreen أو AuthOptionScreen
        MaterialPageRoute(builder: (context) => const OnboardingScreen()), // ✅
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // "Stack" هو الويدجت السحري
    // يسمح لنا بوضع "طبقات" فوق بعضها البعض
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // اجعل "الكومة" تملأ الشاشة بالكامل
        children: [
          // --- الطبقة الأولى (الخلفية): الصورة ---
          Image.asset(
            'assets/images/city_image.png', // !! استبدل هذا بمسار صورتك !!
            fit: BoxFit.cover, // "cover" لملء الشاشة (قد يقص الأطراف)
            // "خدعة" لجعل الصورة أغمق قليلاً ليظهر النص
            color: Colors.black.withOpacity(0.3),
            colorBlendMode: BlendMode.darken,
          ),

          // --- الطبقة الثانية (الأمامية): المحتوى ---
          // "Positioned" لتثبيت المحتوى في الأسفل
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              // "خدعة" تصميم: تدرج لوني من شفاف إلى أسود
              // هذا يضمن قراءة النص بوضوح (كما في تصميمك)
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: const EdgeInsets.all(30.0), // هوامش من كل الجهات
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // محاذاة لليسار
                children: [
                  // 1. النص الكبير
                  const Text(
                    "premium Enjoy the luxury",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36, // حجم خط كبير
                      fontWeight: FontWeight.bold,
                      height: 1.2, // ارتفاع السطر (لضبط المسافة بين السطرين)
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 2. النص الصغير
                  const Text(
                    "premium and pressing hourly rental\nExperience the thrill at lower price",
                    style: TextStyle(
                      color: Colors.white70, // لون أبيض باهت
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // 3. الزر "Let's Go!"
                  ElevatedButton(
                    // لا نحتاج لتصميمه!
                    // سيأخذ التصميم تلقائياً من "الثيم" (theme.dart)
                    // الذي يجعله أزرق وبزوايا دائرية
                    style: ElevatedButton.styleFrom(
                      // فقط نتأكد أنه يملأ العرض
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () => _getStarted(context), // استدعاء الوظيفة
                    child: const Text(
                      "Let's Go!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // مسافة أمان سفلية
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
