import 'package:final_project/providers/auth_provider.dart';
import 'package:final_project/screens/verification_screen.dart'; // ✅ (1) تم إضافة هذا السطر
import 'package:final_project/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  void _register() async {
    // --- (2) تم تعديل هذه الوظيفة ---
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    bool success = await authProvider.register(
      _usernameController.text,
      _emailController.text,
      _mobileController.text,
      _passwordController.text,
    );

    if (mounted) {
      if (success) {
        // --- (3) هذا هو التغيير الرئيسي ---
        // بدلاً من الرجوع، "استبدل" الشاشة الحالية بشاشة التحقق
        // ونقوم بتمرير الإيميل للشاشة التالية
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => VerificationScreen(
              email: _emailController.text, // تمرير الإيميل
            ),
          ),
        );
        // --- نهاية التغيير ---
      } else {
        // إظهار خطأ
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('حدث خطأ أثناء إنشاء الحساب.')),
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
              // صورة السيارة العلوية (نفس صورة الدخول)
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    //!! استبدل هذا بمسار صورتك !!
                    image: AssetImage('assets/images/register_screen/register1.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Register",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 32),
              ),
              Text(
                "Create a new account",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 30),

              // حقل اسم المستخدم
              _buildTextField(_usernameController, "Username"),
              const SizedBox(height: 20),

              // حقل البريد الإلكتروني
              _buildTextField(_emailController, "Email", keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 20),

              // حقل رقم الجوال
              _buildTextField(_mobileController, "Mobile Number", keyboardType: TextInputType.phone),
              const SizedBox(height: 20),

              // حقل كلمة المرور
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
              const SizedBox(height: 30),

              // زر إنشاء الحساب
              ElevatedButton(
                onPressed: _register,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Register", style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 20),

              // لديك حساب بالفعل؟
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have account?", style: Theme.of(context).textTheme.bodyMedium),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // الرجوع لصفحة تسجيل الدخول
                    },
                    child: const Text("Login", style: TextStyle(color: AppTheme.primaryColor)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // دالة مساعدة لإنشاء حقول الإدخال المتشابهة
  Widget _buildTextField(TextEditingController controller, String hint, {TextInputType? keyboardType}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.black), // لون النص أثناء الكتابة
      decoration: InputDecoration(hintText: hint),
    );
  }
}