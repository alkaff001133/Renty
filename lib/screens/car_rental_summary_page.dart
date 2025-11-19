import 'package:final_project/screens/favorites.dart';
import 'package:final_project/screens/home_page.dart';
import 'package:final_project/screens/notafcation.dart';
import 'package:final_project/screens/payment_details_page.dart';
import 'package:final_project/screens/profile_page.dart';
import 'package:flutter/material.dart';

class CarRentalSummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      backgroundColor: Color(0xFFD9D9D9),
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
          'BMW',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {
              Navigator.push(
                buildContext,
                MaterialPageRoute(
                    builder: (context) => const FavoritesPage()),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(child: Icon(Icons.person_outline, color: Colors.white), onTap: ()=> Navigator.push(buildContext, MaterialPageRoute(builder: (context)=> ProfilePage())),),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(color: Colors.white.withOpacity(0.2), height: 1.0),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.0),
                    color: Color(0xFF0083A7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'BMW 8 Series Gran Coupe',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '5.0',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/Mercedes.png',
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'UIF 0804',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  _buildTripInfoCard(buildContext),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  _buildSectionHeader(buildContext, 'Trip saving'),
                  _buildSavingInfo(buildContext),
                  _buildSectionHeader(buildContext, 'Cancellation policy'),
                  _buildPolicyInfo(buildContext),
                  _buildSectionHeader(buildContext, 'Miles included'),
                  _buildMilesInfo(buildContext),
                  _buildSectionHeader(buildContext, 'Insurance & Protection'),
                  _buildInsuranceInfo(buildContext),
                ],
              ),
            ),
          ),
          _buildBottomPaymentBar(buildContext),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(buildContext, 0),
    );
  }

  Widget _buildTripInfoCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.calendar_today, size: 16, color: Colors.grey[700]),
              SizedBox(width: 5),
              Text('Your trip', style: TextStyle(fontSize: 12)),
              Spacer(),
              Text(
                'Trip dates',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            'الخميس 23 أكتوبر 10:00 ص',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'الأحد 28 أكتوبر 10:00 ص',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Divider(height: 10, color: Colors.grey[300]),
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Colors.grey[700]),
              SizedBox(width: 5),
              Text(
                'pickup & return location',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
          Text(
            'Miami, FL 33123',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSavingInfo(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[400], // Dark grey
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('\$US 10', style: TextStyle(color: Colors.green, fontSize: 16)),
          Text(
            'day discount -3',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildPolicyInfo(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[400], // Dark grey
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Free cancellation',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              Icon(Icons.thumb_up_alt_outlined, color: Color(0xFF0083A7)),
            ],
          ),
          SizedBox(height: 5),
          Text(
            'Full refund before Oct 22, 10:00 AM',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildMilesInfo(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[400], // Dark grey
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Unlimited',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildInsuranceInfo(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[400], // Dark grey
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Insurance via Travelers',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          Icon(Icons.verified_user_outlined, color: Color(0xFF0083A7)),
        ],
      ),
    );
  }

  Widget _buildBottomPaymentBar(BuildContext buildContext) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      color: Color(0xFFD9D9D9),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  buildContext,
                  MaterialPageRoute(builder: (context) => PaymentDetailsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0083A7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text(
                'Continue',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    'US \$ 260',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '\$US 281',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
              Text(
                'Before taxes',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              Text(
                '\$0 due now',
                style: TextStyle(color: Color(0xFF0083A7), fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        if (ModalRoute.of(context)?.settings.name != '/') {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        }
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        if (ModalRoute.of(context)?.settings.name != '/profile') {
          Navigator.pushNamed(context, '/profile');
        }
        break;
    }
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
        elevation: 0,onTap: (value) {
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
        ],
      ),
    );
  }
}
