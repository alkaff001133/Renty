import 'package:flutter/material.dart';

class PaymentSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            title: Text(
              'Payment',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            color: Colors.white.withOpacity(0.2),
            height: 1.0,
          ),
        ),
    ),
    body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF0083A7),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 80,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Payment and Booking\nSuccessful',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {

                // );
                print('Navigate to Home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0083A7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              ),
              child: Text(
                'Return Home',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}