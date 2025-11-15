import 'package:final_project/providers/auth_provider.dart';
import 'package:final_project/screens/forgot_password_screen.dart';
import 'package:final_project/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'register_screen.dart';
import 'home_screen.dart'; 



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  void _login() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    
    bool success = await authProvider.login(
      _emailController.text,
      _passwordController.text,
    );

    if (mounted) {
      if (success) {
        // انتقال للشاشة الرئيسية
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        // إظهار خطأ
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('البريد الإلكتروني أو كلمة المرور غير صحيحة')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              // صورة السيارة العلوية
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    //!! استبدل هذا بمسار صورتك !!
                    image: AssetImage('assets/images/login_screen/login.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Welcome",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 32),
              ),
              Text(
                "Login to your account",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 30),
              
              // حقل البريد الإلكتروني
              Text("Email", style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 8),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.black), // لون النص أثناء الكتابة
                decoration: const InputDecoration(hintText: "Email"),
              ),
              const SizedBox(height: 20),

              // حقل كلمة المرور
              Text("Password", style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                obscureText: _obscureText,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              
              // نسيت كلمة المرور
             // نسيت كلمة المرور
Align(
  alignment: Alignment.centerRight,
  child: TextButton(
    onPressed: () {
      
      // --- هذا هو الكود الذي تحتاجه ---
      // "اذهب إلى" شاشة نسيت كلمة المرور
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        ),
      );
      // --- نهاية الكود ---

    },
    child: const Text("Forgot Password?", style: TextStyle(color: AppTheme.primaryColor)),
  ),
),
              const SizedBox(height: 20),

              // زر تسجيل الدخول
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Login", style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 30),

              // إنشاء حساب جديد
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have account?", style: Theme.of(context).textTheme.bodyMedium),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegisterScreen()),
                      );
                    },
                    child: const Text("Create Now", style: TextStyle(color: AppTheme.primaryColor)),
                  ),
                ],
              ),
              // يمكنك إضافة أزرار السوشيال ميديا هنا إذا أردت
            ],
          ),
        ),
      ),
    );
  }
}