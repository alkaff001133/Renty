import 'package:final_project/screens/login_screen.dart';
import 'package:final_project/screens/verification_screen.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../utils/theme.dart';

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
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    bool success = await authProvider.register(
      _usernameController.text,
      _emailController.text,
      _mobileController.text,
      _passwordController.text,
    );

        if (_usernameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _mobileController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return; 
    }


      if (mounted) {
      if (success) {

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => VerificationScreen(
              email: _emailController.text, 
            ),
          ),
        );

      } else {

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('An error occurred while creating the account')),
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

              Container(
                height: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(

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


              _buildTextField(_usernameController, "Username"),
              const SizedBox(height: 20),


              _buildTextField(_emailController, "Email", keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 20),


              _buildTextField(_mobileController, "Mobile Number", keyboardType: TextInputType.phone),
              const SizedBox(height: 20),


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


              ElevatedButton(
                onPressed: _register,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Register", style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 20),


Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text("Already have account?", style: Theme.of(context).textTheme.bodyMedium),
    TextButton(
      onPressed: () {
        

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );


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


  Widget _buildTextField(TextEditingController controller, String hint, {TextInputType? keyboardType}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.black), 
      decoration: InputDecoration(hintText: hint),
    );
  }
}