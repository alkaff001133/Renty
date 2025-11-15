import 'dart:async';
import 'package:final_project/screens/login_screen.dart';
import 'package:final_project/utils/theme.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  final String email; 
  
  const VerificationScreen({super.key, required this.email});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  Timer? _timer; 
  int _seconds = 50; 

  @override
  void initState() {
    super.initState();
    startTimer(); 
  }

  @override
  void dispose() {
    _timer?.cancel(); 
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }


  void _verifyAndNavigate() {

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
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

                    image: AssetImage('assets/images/register_screen/register2.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Verification",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 32),
              ),
              Text(
                "Messenger has send a code to verify your account",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 30),


              Text("Email OTP", style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildOtpBox(),
                  _buildOtpBox(),
                  _buildOtpBox(),
                  _buildOtpBox(),
                ],
              ),
              const SizedBox(height: 20),


              Text("Mobile OTP", style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildOtpBox(),
                  _buildOtpBox(),
                  _buildOtpBox(),
                  _buildOtpBox(),
                ],
              ),
              const SizedBox(height: 30),


              ElevatedButton(
                onPressed: _verifyAndNavigate, 
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Verify", style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 20),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Resend : ", style: Theme.of(context).textTheme.bodyMedium),
                  Text(
                    "00:${_seconds.toString().padLeft(2, '0')}", 
                    style: const TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildOtpBox() {
    return Container(
      width: 60, 
      height: 60, 
      decoration: BoxDecoration(
        color: AppTheme.textFieldFillColor, 
        borderRadius: BorderRadius.circular(10), 
      ),


    );
  }
}