import 'package:final_project/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';



class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});


  void _getStarted(BuildContext context) async {
    if (context.mounted) {

      Navigator.pushReplacement(
        context,

        MaterialPageRoute(builder: (context) => const OnboardingScreen()), // ✅
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        fit: StackFit.expand, 
        children: [

          Image.asset(
            'assets/images/being_screen/welcome.png', 
            fit: BoxFit.cover, 

            color: Colors.black.withOpacity(0.3),
            colorBlendMode: BlendMode.darken,
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(

              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: const EdgeInsets.all(30.0), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [

                  const Text(
                    "premium Enjoy the luxury",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36, 
                      fontWeight: FontWeight.bold,
                      height: 1.2, 
                    ),
                  ),
                  const SizedBox(height: 16),


                  const Text(
                    "premium and pressing hourly rental\nExperience the thrill at lower price",
                    style: TextStyle(
                      color: Colors.white70, 
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 40),


                  ElevatedButton(


                    style: ElevatedButton.styleFrom(

                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () => _getStarted(context), 
                    child: const Text(
                      "Let's Go!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

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
