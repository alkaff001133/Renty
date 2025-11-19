import 'package:final_project/screens/favorites.dart';
import 'package:final_project/screens/home_page.dart';
import 'package:final_project/screens/notafcation.dart';
import 'package:final_project/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'booking_review_page.dart';

class PaymentDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(buildContext);
              },
            ),
            title: Text(
              'Payment',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(Icons.person_outline, color: Colors.white),
              ),
            ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            color: Colors.white.withOpacity(0.2),
            height: 1.0,
          ),
        ),
    ),
    body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter Payment Details',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _buildTextField(
              context: buildContext,
              label: 'Cardholder Name',
              icon: Icons.lock_outline,
              hintText: '',
            ),
            SizedBox(height: 15),
            _buildTextField(
              context: buildContext,
              label: 'Card Number',
              icon: Icons.lock_outline,
              hintText: '',
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 15),
            _buildTextField(
              context: buildContext,
              label: 'Expiry Date',
              icon: Icons.calendar_today_outlined,
              hintText: '',
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 30),
            Text(
              'Choose Payment Method',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            _buildPaymentMethodLogos(buildContext),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    buildContext,
                    MaterialPageRoute(builder: (context) => BookingReviewPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0083A7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  'Proceed Payment & Review',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(buildContext, 1),
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    required String label,
    required IconData icon,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        SizedBox(height: 8),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            keyboardType: keyboardType,
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              suffixIcon: Icon(icon, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodLogos(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildPaymentLogo('assets/images/PayPal.png'),
        _buildPaymentLogo('assets/images/GooglePay.png'),
        _buildPaymentLogo('assets/images/Mastercard.png'),
        _buildPaymentLogo('assets/images/Visa.png'),
      ],
    );
  }

  Widget _buildPaymentLogo(String imagePath) {
    return Container(
      width: 60,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(5),
      child: Image.asset(imagePath, fit: BoxFit.contain),
    );
  }



  Widget _buildBottomNavBar(BuildContext context, int currentIndex) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF0083A7),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],onTap: (value) {
          switch(value) {
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
              break;
            case 1:
              // زر Notifications
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationsPage()),
              );
              break;
            case 2:
              // زر Favorites
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FavoritesPage()),
              );
              break;
            case 3:
              // زر Profile
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
          }
        },
      ),
    );
  }
}