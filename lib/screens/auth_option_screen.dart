import 'package:flutter/material.dart';
import 'login_screen.dart'; 
import 'register_screen.dart'; 
class AuthOptionScreen extends StatelessWidget {
  const AuthOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        fit: StackFit.expand, 
        children: [

          Image.asset(
            'assets/images/login_and_register_screen/login_and_register.png', 
            fit: BoxFit.cover,


            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.4),
            colorBlendMode: BlendMode.darken,
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end, 
              children: [

                ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {

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
                const SizedBox(height: 16),


                const Text(
                  "OR",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 16), 


                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {

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
                const SizedBox(height: 40), 


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Google
                    _buildSocialIcon(Icons.g_mobiledata), 
                    const SizedBox(width: 30),
                    // Facebook
                    _buildSocialIcon(Icons.facebook), 
                    const SizedBox(width: 30),
                    // Instagram
                    _buildSocialIcon(Icons.camera_alt_outlined), 
                  ],
                ),
                const SizedBox(height: 60), 
              ],
            ),
          ),
        ],
      ),
    );
  }


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

