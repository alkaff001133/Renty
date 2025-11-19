import 'package:flutter/material.dart';

class Rotatedboxs extends StatelessWidget {
  const Rotatedboxs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: RotatedBox(
          // quarterTurns: 1, // 90 degrees
          // quarterTurns: 2, // 180 degrees
          // quarterTurns: 3, // 270 degrees
          quarterTurns: 4, // 360 degrees
          child: Container(
            height: 100,
            width: 300,
            color: Colors.blue,
            child: Center(
              child: Text(
                'RotatedBox',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
