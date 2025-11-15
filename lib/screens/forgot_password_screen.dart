import 'package:final_project/utils/theme.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();


  void _sendOTP() {

    if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email address')),
      );
      return; 
    }
    

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('A reset link has been sent to your email!')),
    );


    Navigator.pop(context); 
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

              Container(
                height: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(

                    image: AssetImage('assets/images/register_screen/register3.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Forgot Password",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 32),
              ),
              const SizedBox(height: 10),
              Text(
                "Enter your email",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 30),


              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.black), // لون النص أثناء الكتابة
                decoration: const InputDecoration(hintText: "Email"),
              ),
              const SizedBox(height: 20),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Choose Another Method",
                      style: TextStyle(color: AppTheme.primaryColor),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Need Help?",
                      style: TextStyle(color: AppTheme.primaryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),


              ElevatedButton(
                onPressed: _sendOTP, 
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Send OTP", style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}