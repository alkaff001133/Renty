import 'package:flutter/material.dart';

class Textspans extends StatelessWidget {
  const Textspans({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text.rich(
          TextSpan(
            text: 'Hello ',
            style: TextStyle(color: Colors.black, fontSize: 30),
            children: <TextSpan>[
              TextSpan(
                text: 'bold',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              TextSpan(text: ' world! ', style: TextStyle(color: Colors.green)),
              TextSpan(
                text: 'italic',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
