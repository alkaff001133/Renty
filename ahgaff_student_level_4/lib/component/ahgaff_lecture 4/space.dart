import 'package:flutter/material.dart';

class Spaces extends StatelessWidget {
  const Spaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(height: 100, color: Colors.red),
          Spacer(flex: 1),
          Container(height: 100, color: Colors.green),
          Spacer(flex: 1),
          Container(height: 100, color: Colors.black),
          Spacer(flex: 2),
          Container(height: 100, color: Colors.blue),
        ],
      ),
    );
  }
}
