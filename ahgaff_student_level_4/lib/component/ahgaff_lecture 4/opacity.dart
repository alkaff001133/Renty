import 'package:flutter/material.dart';

class Opacities extends StatelessWidget {
  const Opacities({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Opacity')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.1,
            child: Container(height: 100, color: Colors.blue),
          ),
          Opacity(
            opacity: 0.3,
            child: Container(height: 100, color: Colors.blue),
          ),
          Opacity(
            opacity: 0.5,
            child: Container(height: 100, color: Colors.blue),
          ),
          Opacity(
            opacity: 0.7,
            child: Container(height: 100, color: Colors.blue),
          ),
          Opacity(
            opacity: 0.9,
            child: Container(height: 100, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
