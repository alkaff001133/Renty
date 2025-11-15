import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_option_screen.dart';


// نموذج بيانات لكل شاشة
class OnboardingContent {
  final String image;
  final String title;
  final String description;

  OnboardingContent({required this.image, required this.title, required this.description});
}

// قائمة البيانات
final List<OnboardingContent> onboardingPages = [
  OnboardingContent(
    image: 'assets/images/crypto1.png', // استبدل هذا بمسار صورتك
    title: 'Track Your Crypto',
    description: 'Nill Gorsus mal suada Orea Puno os Quisque vitae nisl.',
  ),
  OnboardingContent(
    image: 'assets:images/crypto2.png', // استبدل هذا بمسار صورتك
    title: 'Explore Best Coins',
    description: 'Nill Gorsus mal suada Orea Puno os Quisque vitae nisl.',
  ),
  OnboardingContent(
    image: 'assets:images/crypto3.png', // استبدل هذا بمسار صورتك
    title: 'Fast Optimization',
    description: 'Nill Gorsus mal suada Orea Puno os Quisque vitae nisl.',
  ),
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // دالة للانتقال عند الانتهاء
  void _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingComplete', true); // حفظ أن المستخدم أكملها
    
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthOptionScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingPages.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPageWidget(
                    content: onboardingPages[index],
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // مؤشر النقاط
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onboardingPages.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    // زر المتابعة
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00BFFF), // لون الزر في هذا التصميم
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        if (_currentPage == onboardingPages.length - 1) {
                          // آخر صفحة
                          _completeOnboarding();
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      // التصميم استخدم كلمة Countiue (بخطأ إملائي)
                      child: Text(
                        _currentPage == onboardingPages.length - 1 
                          ? 'Get Started' 
                          : 'Continue', // يمكنك استخدام "Countiue" لتطابق التصميم
                        style: const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ويدجت النقطة (المؤشر)
  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: _currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.white : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

// ويدجت مخصصة لصفحة الترحيب الواحدة
class OnboardingPageWidget extends StatelessWidget {
  final OnboardingContent content;
  const OnboardingPageWidget({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // الصورة (استخدم صورة حقيقية هنا)
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                // استبدل هذا بمسار صورتك الحقيقي 
                image: AssetImage(content.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // النصوص
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Text(
                content.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 28),
              ),
              const SizedBox(height: 16),
              Text(
                content.description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}